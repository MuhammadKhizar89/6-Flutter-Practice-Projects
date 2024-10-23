import 'package:flutter/material.dart';

class GenericTextWidget extends StatelessWidget {
  const GenericTextWidget(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 30, color: Colors.white),
    );
  }
}
