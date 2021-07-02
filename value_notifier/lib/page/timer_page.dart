import 'package:flutter/material.dart';

import 'widgets/countdown_view/countdown_view_widget.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Timer")),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.shortestSide * 0.1),
        child: TimerCountdownView(),
      ),
    );
  }
}
