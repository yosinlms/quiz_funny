import 'package:flutter/material.dart';
import 'package:quiz_funny/Data/questions.dart';
import 'package:quiz_funny/question_screen.dart';
import 'package:quiz_funny/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  //lis kosong untuk jawaban yang dpilih
  List<String> selectedAnswer = [];
  var activeScreen = 'start-screen';

  //fungsi untuk mengubah layar start ke layar pertanyaan
  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

//
  void chooseAnswer(answer) {
    selectedAnswer.add(answer);

    setState(() {
      if (selectedAnswer.length == questions.length) {
        selectedAnswer = [];
        activeScreen = 'start-screen';
      }
    });
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
