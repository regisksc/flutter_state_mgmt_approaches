import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../countdown_view_controller.dart';

class CountdownWidget extends StatefulWidget {
  const CountdownWidget({
    Key? key,
    required this.amountOfSeconds,
    required this.isPaused,
  }) : super(key: key);

  final int amountOfSeconds;
  final bool isPaused;

  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> with TickerProviderStateMixin {
  late AnimationController blinkingController;
  late Animation blinking;
  final countdownController = GetIt.instance.get<CountdownViewController>();

  @override
  void initState() {
    blinkingController = AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    blinking = Tween<double>(begin: 0, end: 1).animate(blinkingController);
    blinkingController.forward();
    blinkingController.addListener(() async {
      if (blinking.value == 1) {
        await Future.delayed(Duration(milliseconds: 400));
        blinkingController.reverse();
      } else if (blinking.value == 0) {
        await Future.delayed(Duration(milliseconds: 400));
        blinkingController.forward();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.shortestSide * .8,
      height: 200,
      child: Center(
        child: AnimatedBuilder(
            animation: blinking,
            builder: (context, _) {
              return AnimatedOpacity(
                opacity: countdownController.timerState.value == TimerState.paused ? blinking.value : 1,
                duration: Duration(milliseconds: 250),
                child: Text(
                  widget.amountOfSeconds.toString(),
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
