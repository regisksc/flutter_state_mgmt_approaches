import 'package:flutter/material.dart';

import '../../../shared/constants/constants.dart';
import '../../timer_controller.dart';
import '../countdown_view/countdown_view_controller.dart';

class TimerInputViewController {
  final TimerController timerController;
  final CountdownViewController countdownController;

  TimerInputViewController({required this.timerController, required this.countdownController});

  final showPageContent = ValueNotifier(true);
  int _timer = 5;
  setTimer(int seconds) => _timer = seconds;

  onSend() {
    showPageContent.value = false;
    _setTimer();
    _enableTimerVisibility();
    _changePageState();
  }

  _changePageState() {
    Future.delayed(Constants.fadeTransitionDuration, () {
      timerController.timerStep.value = CountdownViewStep();
    });
  }

  _enableTimerVisibility() {
    if (!countdownController.showPageContent.value) {
      countdownController.showPageContent.value = true;
    }
  }

  _setTimer() {
    countdownController.setTimer(_timer);
    countdownController.timeToDisplay.value = _timer;
  }
}
