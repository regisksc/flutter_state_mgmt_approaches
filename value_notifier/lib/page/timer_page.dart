import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:value_notifier/page/widgets/countdown_view/countdown_view_controller.dart';
import 'package:value_notifier/page/widgets/input_view/input_view_widget.dart';

import 'logic/notifiers/timer_step_notifier.dart';
import 'timer_controller.dart';
import 'widgets/countdown_view/countdown_view_widget.dart';

class TimerPage extends StatelessWidget {
  TimerPage({Key? key}) : super(key: key);

  final controller = GetIt.instance.get<TimerController>();
  final controller2 = GetIt.instance.get<CountdownViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Timer")),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.shortestSide * 0.1),
        child: ValueListenableBuilder<TimerStep>(
          valueListenable: controller.timerStep,
          builder: (_, step, __) {
            if (step is InputTimeStep) return TimerInputView();
            return TimerCountdownView();
          },
        ),
      ),
    );
  }
}
