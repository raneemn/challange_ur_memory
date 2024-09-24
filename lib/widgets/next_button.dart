import 'package:challenge_ur_memory/constants.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: orangeColor, borderRadius: BorderRadius.circular(10)),
        child: Text(
          'السؤال التالي',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ));
  }
}
