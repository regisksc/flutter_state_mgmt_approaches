import 'dart:async';

import 'package:flutter/material.dart';
import 'package:value_notifier/shared/adapters/di_adapter.dart';

import '../../countdown_view_controller.dart';

class CountdownWidget extends StatefulWidget {
  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> with TickerProviderStateMixin {
  late AnimationController blinkingController;
  late Animation blinking;
  final countdownController = DiAdapter().get<CountdownViewController>();

  @override
  void initState() {
    blinkingController = AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    blinking = Tween<double>(begin: 0, end: 1).animate(blinkingController);
    blinkingController.forward();
    blinkingController.addStatusListener(_rangeAnimation);
    super.initState();
  }

  Timer? _timer;
  void _rangeAnimation(status) {
    debugPrint(_timer.toString());
    if (status == AnimationStatus.completed) {
      _timer = Timer(const Duration(milliseconds: 400), () {
        if (mounted) blinkingController.reverse();
      });
    } else if (status == AnimationStatus.dismissed) {
      _timer = Timer(const Duration(milliseconds: 400), () {
        if (mounted) blinkingController.forward();
      });
    }
  }

  @override
  void dispose() {
    blinkingController.removeStatusListener(_rangeAnimation);
    blinkingController.dispose();
    super.dispose();
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
                  countdownController.timeToDisplay.value.toString(),
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
