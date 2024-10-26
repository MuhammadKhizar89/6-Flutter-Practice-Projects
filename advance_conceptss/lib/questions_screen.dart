import 'package:flutter/material.dart';
import "package:advance_conceptss/answer_button.dart";
import "package:advance_conceptss/data/questions.dart";
// import "package:google_fonts/google_fonts.dart";

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectedAnswer});
  final void Function(String answer) onSelectedAnswer;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var index = 0;
  void indexIncreaser(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    if (questions.length - 1 != index) {
      setState(() {
        index++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[index];

    return Container(
      margin: const EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledOptions().map(
              (option) {
                return AnswerButton(
                    onTap: () {
                      indexIncreaser(option);
                    },
                    answerText: option);
              },
            )
          ],
        ),
      ),
    );
  }
}
