import "package:flutter/material.dart";
import "package:advance_concepts/starting_page.dart";

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168),
            ],
          )),
          child: const StartingPage(),
        ),
      ),
    ),
  );
}
