import "package:advance_conceptss/data/questions.dart";
import "package:advance_conceptss/questions_screen.dart";
import "package:advance_conceptss/results_screen.dart";
import "package:flutter/material.dart";
import "package:advance_conceptss/starting_page.dart";

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];
  @override
  void initState() {
    super.initState();
    activeScreen = StartingPage(switchScreen);
  }

  void onRestart() {
    setState(() {
      activeScreen = StartingPage(switchScreen);
      selectedAnswers = [];
    });
  }

  void selectAnswer(String answers) {
    selectedAnswers.add(answers);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen =
            ResultsScreen(chosenAnswers: selectedAnswers, onRestart: onRestart);
        selectedAnswers = [];
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(onSelectedAnswer: selectAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
