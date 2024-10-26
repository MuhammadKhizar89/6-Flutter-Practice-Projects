import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 14),
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: data["correct_answer"] == data["user_answer"]
                            ? Color.fromARGB(255, 110, 240, 93)
                            : Color.fromARGB(255, 236, 78, 78),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                          ((data["question_index"] as int) + 1).toString()),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data["question"] as String,
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                data["user_answer"] as String,
                                style: const TextStyle(
                                  color: Color.fromARGB(162, 255, 255, 255),
                                ),
                              ),
                              Text(
                                data["correct_answer"] as String,
                                style: const TextStyle(color: Colors.amber),
                              ),
                            ]),
                      ),
                    )
                  ]);
            },
          ).toList(),
        ),
      ),
    );
  }
}
