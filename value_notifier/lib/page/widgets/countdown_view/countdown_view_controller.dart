import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:value_notifier/shared/constants/constants.dart';

class CountdownViewController {
  int _timerAmountInSeconds = Constants.defaultTimerAmountOfSeconds;
  void setTimer(int seconds) => _timerAmountInSeconds = seconds;
  late Timer timer;
  final timeToDisplay = ValueNotifier(Constants.defaultTimerAmountOfSeconds);
  void start() {
    timer = Timer(
      Duration(milliseconds: _timerAmountInSeconds * 1000),
      () => timeToDisplay.value = timer.tick,
    );
  }
}
