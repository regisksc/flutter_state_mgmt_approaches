import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../constants/constants.dart';

enum TimerState { initial, paused, running, over }

class CountdownViewController {
  final showPageContent = ValueNotifier(true);

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
    if (timerState.value == TimerState.running) timerState.value = TimerState.paused;
    stopTimer();
  }

  void stopTimer() => timerState.value != TimerState.initial ? _timer.cancel() : null;

  void restart() {
    stopTimer();
    timerState.value = TimerState.initial;
    timeToDisplay.value = _timerAmountInSeconds;
  }

  bool get showPlayButton => timerState.value != TimerState.running;
}
