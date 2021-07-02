import 'package:flutter/material.dart';

import 'widgets/button_widget.dart';

class ButtonRow extends StatelessWidget {
  const ButtonRow({
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
          Button(icon: Icons.play_arrow),
          Button(icon: Icons.pause),
          Button(icon: Icons.restart_alt_sharp),
        ],
      ),
    );
  }
}
