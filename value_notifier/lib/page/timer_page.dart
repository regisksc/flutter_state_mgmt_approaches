import 'package:flutter/material.dart';
import 'package:value_notifier/page/widgets/countdown_view/countdown_view_controller.dart';
import 'package:value_notifier/page/widgets/input_view/input_view_widget.dart';
import 'package:value_notifier/shared/adapters/di_adapter.dart';

import 'timer_controller.dart';
import 'widgets/countdown_view/countdown_view_widget.dart';
import 'widgets/input_view/input_view_controller.dart';

class TimerPage extends StatelessWidget {
  TimerPage({Key? key}) : super(key: key);

  final controller = DiAdapter().get<TimerController>();
  final controller2 = DiAdapter().get<CountdownViewController>();

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return SafeArea(
        right: orientation == Orientation.landscape,
        left: orientation == Orientation.landscape,
        top: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(title: Text("Timer")),
          body: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.shortestSide * 0.1),
            child: ValueListenableBuilder<TimerStep>(
              valueListenable: controller.timerStep,
              builder: (_, step, __) {
                final controller = DiAdapter().get<TimerInputViewController>();
                if (step is InputTimeStep) return TimerInputView(controller: controller);
                return TimerCountdownView();
              },
            ),
          ),
        ),
      );
    });
  }
}
