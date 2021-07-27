import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:value_notifier/shared/constants/constants.dart';

enum TimerState { initial, paused, running }

class CountdownViewController {
  int _timerAmountInSeconds = Constants.defaultTimerAmountOfSeconds;
  void setTimer(int seconds) => _timerAmountInSeconds = seconds;
  final timerState = ValueNotifier(TimerState.initial);
  late Timer _timer;
  late ValueNotifier<int> timeToDisplay = ValueNotifier(_timerAmountInSeconds);
  bool get canPlayOrPause => timeToDisplay.value != 0;

  void start() {
    timerState.value = TimerState.running;
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (_) => timeToDisplay.value != 0 ? timeToDisplay.value-- : _timer.cancel(),
    );
  }

  void pause() {
    timerState.value = TimerState.paused;
    _timer.cancel();
  }

  void restart() {
    _timer.cancel();
    timerState.value = TimerState.initial;
    timeToDisplay.value = Constants.defaultTimerAmountOfSeconds;
  }

  bool get showPlayButton => timerState.value == TimerState.paused || timerState.value == TimerState.initial;
}
