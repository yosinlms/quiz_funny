import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_funny/Data/questions.dart';
import 'package:quiz_funny/answerButton.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  //untuk beritahu index pertanyaan dimulai dari 0
  var currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    //sebagai variable pertanyaan sekarang
    final currentQuestion = questions[currentQuestionIndex];

//fungsi untuk menjawab pertanyaan
    void answerQuestion(String jawabanPilihan) {
      widget.onSelectAnswer(jawabanPilihan);
      setState(() {
        currentQuestionIndex++;
      });
    }

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                textAlign: TextAlign.center,
                currentQuestion.text,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                )),

            SizedBox(height: 16),
            // Answerbutton(answerText: currentQuestion.answer[0], onTap: () {}),
            ...currentQuestion.getShuffleList().map(
              (answer) {
                return SizedBox(
                  width: double.infinity,
                  child: AnswerButton(
                    answerText: answer,
                    onTap: () {
                      answerQuestion(answer);
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
