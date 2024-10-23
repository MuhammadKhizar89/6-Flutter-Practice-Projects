import 'package:flutter/material.dart';
import 'package:first_app/first_widget.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: FirstWidget(
          colors: [Colors.red, Colors.blue],
        ),
      ),
    ),
  );
}
