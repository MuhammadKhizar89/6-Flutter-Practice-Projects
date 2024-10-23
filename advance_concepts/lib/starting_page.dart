import "package:flutter/material.dart";

class StartingPage extends StatelessWidget {
  const StartingPage(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(143, 255, 254, 254),
          ),
          // Image.asset(
          //   "assets/images/quiz-logo.png",
          //   width: 300,
          //   color: Colors.black,
          // ),
          // Opacity(
          //   opacity: 0.5,
          //   child: Image.asset(
          //     "assets/images/quiz-logo.png",
          //     width: 300,
          //   ),
          // ),
          const SizedBox(height: 30),
          const Text(
            "Learn Flutter the fun way!",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              "Start Quiz",
            ),
          )
        ],
      ),
    );
  }
}
