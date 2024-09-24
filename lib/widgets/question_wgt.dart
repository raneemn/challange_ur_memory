import 'dart:async';
import 'package:challenge_ur_memory/constants.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    super.key,
    required this.question,
  });
  final String question;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        '$question',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w500, color: darkGreen),
      ),
    );
  }
}
