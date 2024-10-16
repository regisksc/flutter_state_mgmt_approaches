import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key? key, this.onTap, required this.icon}) : super(key: key);
  final Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        shape: CircleBorder(),
        padding: EdgeInsets.zero,
        shadowColor: Theme.of(context).primaryColor,
        animationDuration: Duration.zero,
      ),
      onPressed: onTap ?? () {},
      child: Icon(
        icon,
        size: 100,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
