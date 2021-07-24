import 'package:flutter/material.dart';
import 'package:value_notifier/page/widgets/countdown_view/countdown_view_controller.dart';

import 'widgets/button_widget.dart';

class ButtonRow extends StatelessWidget {
  final CountdownViewController controller;
  const ButtonRow({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.shortestSide * .8,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Button(
            icon: Icons.play_arrow,
            onTap: () => controller.start(),
          ),
          Button(
            icon: Icons.pause,
            onTap: () => controller.pause(),
          ),
          Button(
            icon: Icons.restart_alt_sharp,
            onTap: () => controller.restart(),
          ),
        ],
      ),
    );
  }
}
