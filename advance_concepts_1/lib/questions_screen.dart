import 'package:flutter/material.dart';
import "package:advance_concepts_1/answer_button.dart";
import "package:advance_concepts_1/data/questions.dart";
// import "package:advance_concepts_1/google_fonts.dart";

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
              // style: GoogleFonts.lato(
              //     color: Colors.white,
              //     fontWeight: FontWeight.bold,
              //     fontSize: 24),
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
