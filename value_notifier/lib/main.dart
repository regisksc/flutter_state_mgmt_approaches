import 'package:flutter/material.dart';

import 'page/timer_page.dart';

void main() {
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
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: AppColors.primaryColor,
        primaryColor: AppColors.secondaryColor,
      ),
      home: TimerPage(),
    );
  }
}
