import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key? key, this.onTap, required this.icon}) : super(key: key);
  final Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).accentColor,
        ),
        child: SizedBox.expand(
          child: Icon(
            icon,
            size: 100,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
