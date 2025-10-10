import 'package:flutter/material.dart';
import 'package:quiz_funny/question_screen.dart';
import 'package:quiz_funny/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // var activeScreen = 'start-screen';
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  // void switchScreen() {
  //   setState(() {
  //     activeScreen = 'question-screen';
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen();
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                const Color.fromARGB(255, 44, 94, 179),
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
