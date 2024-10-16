import 'package:flutter/material.dart';

import '../input_view_controller.dart';

class StartTimerButton extends StatelessWidget {
  const StartTimerButton(this._controller);
  final TimerInputViewController _controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: 140,
        height: 50,
        child: ElevatedButton.icon(
          onPressed: _controller.onSend,
          icon: Icon(Icons.play_arrow_rounded),
          label: Text('Start', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
