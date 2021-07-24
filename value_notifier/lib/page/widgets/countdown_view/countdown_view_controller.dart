import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:value_notifier/shared/constants/constants.dart';

class CountdownViewController {
  int _timerAmountInSeconds = Constants.defaultTimerAmountOfSeconds;
  void setTimer(int seconds) => _timerAmountInSeconds = seconds;
  final isPaused = ValueNotifier(true);
  late Timer timer;
  final timeToDisplay = ValueNotifier(Constants.defaultTimerAmountOfSeconds);

  void start() {
    isPaused.value = false;
    timer = Timer.periodic(
      Duration(seconds: 1),
      (_) {
        if (timeToDisplay.value != 0) {
          timeToDisplay.value--;
        } else {
          timer.cancel();
        }
        timeToDisplay.notifyListeners();
      },
    );
  }

  void pause() {
    isPaused.value = true;
    timer.cancel();
  }

  void restart() {
    timer.cancel();
    isPaused.value = false;
    timeToDisplay.value = Constants.defaultTimerAmountOfSeconds;
  }
}
