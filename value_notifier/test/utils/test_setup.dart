import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:value_notifier/page/timer_controller.dart';
import 'package:value_notifier/page/widgets/countdown_view/countdown_view_controller.dart';
import 'package:value_notifier/page/widgets/input_view/input_view_controller.dart';

void initDependencies() {
  final di = GetIt.instance;
  di.registerLazySingleton(() => TimerController());
  di.registerLazySingleton(
    () => TimerInputViewController(countdownController: di.get(), timerController: di.get()),
  );
  di.registerLazySingleton(() => CountdownViewController());
}

Future<void> loadPage(WidgetTester tester, {required Widget page}) async {
  await tester.pumpWidget(
    MaterialApp(
      home: page,
    ),
  );
}

Future<void> loadWidget(WidgetTester tester, {required Widget widget}) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: widget,
      ),
    ),
  );
}
