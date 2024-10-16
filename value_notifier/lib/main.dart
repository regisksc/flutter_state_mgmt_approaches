import 'package:flutter/material.dart';
import 'package:value_notifier/page/widgets/countdown_view/countdown_view_controller.dart';
import 'package:value_notifier/shared/adapters/di_adapter.dart';

import 'page/timer_controller.dart';
import 'page/timer_page.dart';
import 'page/widgets/input_view/input_view_controller.dart';

void main() {
  final di = DiAdapter();
  di.register(() => TimerController());
  di.register(
    () => TimerInputViewController(countdownController: di.get(), timerController: di.get()),
  );
  di.register(() => CountdownViewController());
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
        hintColor: AppColors.primaryColor,
        primaryColor: AppColors.secondaryColor,
      ),
      home: TimerPage(),
    );
  }
}
