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
        'questions_index': i,
        'questions': questions[0],
        'correct_answer': questions[i].answers[0],
        'user_answer': jawabanTerpilih[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                textAlign: TextAlign.center,
                'Anda telah menjawab 2 pertanyaan dari 10 pertanyaan dengan benar',
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),
            Text(
                textAlign: TextAlign.center,
                'List dari jawaban',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                )),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: () {}, child: Text('Restart Quiz'))
          ],
        ),
      ),
    );
  }
}
