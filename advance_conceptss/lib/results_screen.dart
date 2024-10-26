import "package:advance_conceptss/questions_summary.dart";
import "package:flutter/material.dart";
import "package:advance_conceptss/data/questions.dart";

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.onRestart});
  final void Function() onRestart;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryData = [];
    for (int i = 0; i < chosenAnswers.length; i++) {
      summaryData.add({
        "question_index": i,
        "question": questions[i].question,
        "correct_answer": questions[i].options[0],
        "user_answer": chosenAnswers[i]
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final correctAnswers = getSummaryData()
        .where((element) => element["user_answer"] == element["correct_answer"])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "You answered $correctAnswers out of ${questions.length} questions correctly!",
                style: const TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center),
            const SizedBox(height: 30),
            QuestionsSummary(getSummaryData()),
            const SizedBox(height: 30),
            OutlinedButton(
              onPressed: onRestart,
              child: const Text(
                "Back to start!",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
