import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:value_notifier/page/widgets/countdown_view/countdown_view_controller.dart';

import 'page/timer_controller.dart';
import 'page/timer_page.dart';
import 'page/widgets/input_view/input_view_controller.dart';

void main() {
  final di = GetIt.instance;
  di.registerLazySingleton(() => TimerController());
  di.registerLazySingleton(
    () => TimerInputViewController(countdownController: di.get(), timerController: di.get()),
  );
  di.registerLazySingleton(() => CountdownViewController());
  runApp(MyApp());
}

abstract class AppColors {
  static final primaryColor = Colors.pink.shade200;
  static final secondaryColor = Colors.pink.shade400;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            final currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
              currentFocus.focusedChild?.unfocus();
            }
          },
          child: child,
        );
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: AppColors.primaryColor,
        primaryColor: AppColors.secondaryColor,
      ),
      home: TimerPage(),
    );
  }
}
