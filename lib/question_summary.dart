import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((data) {
        return Row(
          children: [
            ClipOval(
              child: Container(
                alignment: Alignment.center,
                color: Colors.black,
                width: 24,
                height: 24,
                child: Text(
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                  ((data['question_index'] as int) + 1).toString(),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(data['question'] as String),
                  Text(data['correct_answer'] as String),
                  Text(data['user_answer'] as String),
                ],
              ),
            )
          ],
        );
      }).toList(),
    );
  }
}
