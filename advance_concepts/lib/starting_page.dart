import "package:flutter/material.dart";

class StartingPage extends StatelessWidget {
  const StartingPage({super.key});
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
          ),
          const SizedBox(height: 30),
          const Text(
            "Learn Flutter the fun way!",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          const SizedBox(height: 10),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            child: const Text(
              "-> Start Quiz",
            ),
          )
        ],
      ),
    );
  }
}
