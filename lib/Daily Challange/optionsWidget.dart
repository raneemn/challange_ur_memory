import 'package:challenge_ur_memory/models/model.dart';
import 'package:flutter/material.dart';

class OptionWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<Option> OnClickedOption;

  const OptionWidget(
      {super.key, required this.question, required this.OnClickedOption});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: question.options
              .map((option) => buildOption(context, option))
              .toList(),
        ),
      );

  Widget buildOption(BuildContext context, Option option) {
    return GestureDetector(
      onTap: () => OnClickedOption(option),
      child: Container(
        height: 50,
        width: 260,
        margin: EdgeInsets.symmetric(vertical: 7),
        decoration: BoxDecoration(
            color: Color(0xff9EDEA1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color(0xff9EDEA1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              option.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
