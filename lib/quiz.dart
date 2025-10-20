import 'package:flutter/material.dart';
import 'package:quiz_funny/Data/questions.dart';
import 'package:quiz_funny/question_screen.dart';
import 'package:quiz_funny/resultScreen.dart';
import 'package:quiz_funny/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  //lis kosong untuk jawaban yang dpilih
  List<String> selectedAnswer = [];

  //default toggle layar
  var activeScreen = 'start-screen';

  //fungsi untuk mengubah layar start ke layar pertanyaan
  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

//fungsi untuk menyimpan jawaban
  void chooseAnswer(answer) {
    selectedAnswer.add(answer);

    setState(() {
      if (selectedAnswer.length == questions.length) {
        selectedAnswer = [];
        activeScreen = 'result-screen';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWideget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWideget = QuestionScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'result-screen') {
      screenWideget = Resultscreen(jawabanTerpilih: selectedAnswer);
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
          // child: screenWideget,
          child: screenWideget,
        ),
      ),
    );
  }
}
