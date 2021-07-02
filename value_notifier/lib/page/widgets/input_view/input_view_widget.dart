import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TimerInputView extends StatelessWidget {
  const TimerInputView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                'Input countdown time in seconds:',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: .5,
                ),
              ),
            ),
          ),
          Field(maxLength: 5),
          SizedBox(height: 100),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              width: 140,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.play_arrow_rounded),
                label: Text('Start', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Field extends StatelessWidget {
  const Field({
    Key? key,
    this.keyboardType,
    this.onlyNumbers = true,
    this.maxLength,
  }) : super(key: key);
  final TextInputType? keyboardType;
  final bool onlyNumbers;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    final formatters = <TextInputFormatter>[];
    if (onlyNumbers) formatters.add(FilteringTextInputFormatter.digitsOnly);
    if (maxLength != null) formatters.add(LengthLimitingTextInputFormatter(maxLength));
    return TextField(
      keyboardType: keyboardType ?? TextInputType.number,
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
      textAlign: TextAlign.center,
      inputFormatters: formatters,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).accentColor),
        ),
      ),
    );
  }
}
