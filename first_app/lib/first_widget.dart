// import 'package:first_app/generic_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:first_app/dice_roller.dart';

var firstAlignment = Alignment.topLeft;

class FirstWidget extends StatelessWidget {
  const FirstWidget({super.key, required this.colors});
  final List<Color> colors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: firstAlignment,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(child: DiceRoller()),
    );
  }
}
