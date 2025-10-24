import 'package:flutter/material.dart';

import 'package:quiz_funny/Data/questions.dart';
import 'package:quiz_funny/question_summary.dart';

class Resultscreen extends StatelessWidget {
  const Resultscreen(
      {super.key, required this.jawabanTerpilih, required this.onRestart});

  final List<String> jawabanTerpilih;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < jawabanTerpilih.length; i++) {
      summary.add({
        'question_index': i, //index pertanyaan
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0], //jawaban benar
        'user_answer': jawabanTerpilih[i], //
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestion = questions.length;
    final numCorrectAnswer = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Anda telah menjawab $numCorrectAnswer pertanyaan dari $numTotalQuestion pertanyaan dengan benar'),
              SizedBox(height: 24),
              QuestionSummary(summaryData),
              SizedBox(height: 24),
              ElevatedButton(onPressed: onRestart, child: Text('restart Quiz'))
            ],
          ),
        ),
      ),
    );
  }
}
