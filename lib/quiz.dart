import 'package:flutter/material.dart';
import 'package:quiz_funny/question_screen.dart';
import 'package:quiz_funny/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';

  final List<String> selectedAnswer = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(answer) {
    selectedAnswer.add(answer);
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWideget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWideget = QuestionScreen(onSelectAnswer: chooseAnswer);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.yellow,
                Colors.yellowAccent,
              ],
            ),
          ),
          child: screenWideget,
        ),
      ),
    );
  }
}
