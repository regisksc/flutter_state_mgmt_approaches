import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Field extends StatelessWidget {
  const Field({
    Key? key,
    required this.onChanged,
    this.keyboardType,
    this.onlyNumbers = true,
    this.maxLength,
  }) : super(key: key);
  final TextInputType? keyboardType;
  final bool onlyNumbers;
  final int? maxLength;
  final Function(String text) onChanged;

  @override
  Widget build(BuildContext context) {
    final formatters = <TextInputFormatter>[];
    if (onlyNumbers) formatters.add(FilteringTextInputFormatter.digitsOnly);
    if (maxLength != null) formatters.add(LengthLimitingTextInputFormatter(maxLength));
    return Material(
      color: Colors.transparent,
      child: TextField(
        keyboardType: keyboardType ?? TextInputType.number,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
        textAlign: TextAlign.center,
        inputFormatters: formatters,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).accentColor),
          ),
        ),
      ),
    );
  }
}
