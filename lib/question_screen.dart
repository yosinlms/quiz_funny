import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'The questions....',
            style: GoogleFonts.poppins(fontSize: 24, color: Colors.white),
          ),
          SizedBox(height: 16),
          ElevatedButton(onPressed: () {}, child: Text('answer 1')),
          ElevatedButton(onPressed: () {}, child: Text('answer 2')),
          ElevatedButton(onPressed: () {}, child: Text('answer 3')),
        ],
      ),
    );
  }
}
