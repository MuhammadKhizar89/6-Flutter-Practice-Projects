import 'package:flutter/material.dart';
import "package:advance_concepts/answer_button.dart";
import "package:advance_concepts/data/questions.dart";

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(content) {
    final currentQuestion = questions[0];

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.question,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 30),
          ...currentQuestion.options.map(
            (option) {
              return AnswerButton(onTap: () {}, answerText: option);
            },
          )
        ],
      ),
    );
  }
}
