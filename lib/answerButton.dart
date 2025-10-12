import 'package:flutter/material.dart';

class Answerbutton extends StatelessWidget {
  const Answerbutton(
      {required this.answerText, required this.onTap, super.key});
  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(answerText),
    );
  }
}
