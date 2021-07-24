import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:value_notifier/shared/constants/constants.dart';

enum TimerState { initial, paused, running }

class CountdownViewController {
  static int _timerAmountInSeconds = Constants.defaultTimerAmountOfSeconds;
  void setTimer(int seconds) => _timerAmountInSeconds = seconds;
  final timerState = ValueNotifier(TimerState.initial);
  late Timer timer;
  final timeToDisplay = ValueNotifier(_timerAmountInSeconds);

  void start() {
    timerState.value = TimerState.running;
    timer = Timer.periodic(
      Duration(seconds: 1),
      (_) {
        timeToDisplay.value != 0 ? timeToDisplay.value-- : timer.cancel();
        timeToDisplay.notifyListeners();
      },
    );
  }

  void pause() {
    timerState.value = TimerState.paused;
    timer.cancel();
  }

  void restart() {
    timer.cancel();
    timerState.value = TimerState.initial;
    timeToDisplay.value = Constants.defaultTimerAmountOfSeconds;
  }

  bool get showPlayButton => timerState.value == TimerState.paused || timerState.value == TimerState.initial;
}
