import 'package:flutter/material.dart';
import 'package:value_notifier/page/logic/notifiers/timer_step_notifier.dart';
import 'package:value_notifier/shared/constants/constants.dart';

import '../../timer_controller.dart';
import '../countdown_view/countdown_view_controller.dart';

class TimerInputViewController {
  final TimerController timerController;
  final CountdownViewController countdownController;

  TimerInputViewController({required this.timerController, required this.countdownController});

  final showTimerInputStep = ValueNotifier(true);
  int _timer = 5;
  void setTimer(int seconds) => _timer = seconds;

  void onSend() {
    showTimerInputStep.value = false;
    Future.delayed(Constants.fadeTransitionDuration, () => countdownController.setTimer(_timer));
    timerController.timerStep.value = CountdownViewStep();
    countdownController.start();
  }
}
