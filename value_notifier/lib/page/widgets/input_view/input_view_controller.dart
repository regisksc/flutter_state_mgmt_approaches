import 'package:flutter/material.dart';

import '../../../shared/constants/constants.dart';
import '../../notifiers/timer_step_notifier.dart';
import '../../timer_controller.dart';
import '../countdown_view/countdown_view_controller.dart';

class TimerInputViewController {
  final TimerController timerController;
  final CountdownViewController countdownController;

  TimerInputViewController({required this.timerController, required this.countdownController});

  final showPageContent = ValueNotifier(true);
  int _timer = 5;
  void setTimer(int seconds) => _timer = seconds;

  void onSend() {
    showPageContent.value = false;
    _setTimer();
    _enableTimerVisibility();
    _changePageState();
  }

  void _changePageState() {
    Future.delayed(Constants.fadeTransitionDuration, () {
      timerController.timerStep.value = CountdownViewStep();
    });
  }

  void _enableTimerVisibility() {
    if (!countdownController.showPageContent.value) {
      countdownController.showPageContent.value = true;
    }
  }

  void _setTimer() {
    countdownController.setTimer(_timer);
    countdownController.timeToDisplay.value = _timer;
  }
}
