import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_funny/Data/questions.dart';
import 'package:quiz_funny/question_summary.dart';

class Resultscreen extends StatelessWidget {
  const Resultscreen(
      {super.key, required this.jawabanTerpilih, required this.onRestart});
  final List<String> jawabanTerpilih;
  final void Function() onRestart;

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> getSummaryData() {
      final List<Map<String, Object>> summary = [];

      for (var i = 0; i < jawabanTerpilih.length; i++) {
        summary.add({
          'question_index': i, //index pertanyaan
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0], //jawaban benar
          'user_answer': jawabanTerpilih[i], //jawaban dari user
        });
      }
      return summary;
    }

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Anda telah menjawab 2 pertanyaan dari 10 pertanyaan dengan benar',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w600)),
              SizedBox(height: 16),
              QuestionSummary(getSummaryData()),
              SizedBox(height: 16),
              ElevatedButton(onPressed: onRestart, child: Text('Restart Quiz'))
            ],
          ),
        ),
      ),
    );
  }
}
