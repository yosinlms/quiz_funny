import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_funny/Data/questions.dart';

class Resultscreen extends StatelessWidget {
  const Resultscreen({super.key, required this.jawabanTerpilih});
  final List<String> jawabanTerpilih;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < jawabanTerpilih.length; i++) {
      summary.add({
        'questions_index': i, //index pertanyaan
        'questions': questions[0],
        'correct_answer': questions[i].answers[0], //jawaban benar
        'user_answer': jawabanTerpilih, //jawaban dari user
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
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
              Text('List dari jawaban',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w400)),
              SizedBox(height: 16),
              ElevatedButton(onPressed: () {}, child: Text('Restart Quiz'))
            ],
          ),
        ),
      ),
    );
  }
}
