import 'package:challenge_ur_memory/constants.dart';
import 'package:flutter/material.dart';


class ResultBox extends StatelessWidget {
  const ResultBox(
      {super.key, required this.result, required this.questionLength, required this.onTap});
  final int result;
  final int questionLength;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      content: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'نتيجتك',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 70,
              backgroundColor: result == questionLength / 2
                  ? Colors.yellow
                  : result < questionLength / 2
                      ? incorrectColor
                      : correctColor,
              child: Text('$result/$questionLength',
                  style: TextStyle(fontSize: 30, color: Colors.white)),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(result <= questionLength / 2
                      ? 'راجع حفظك وأعد المحاولة'
                      : 'بارك الله في حفظك',
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: onTap,
                child: const Text(
                  'الصفحة الرئيسية',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 21),
                ))
          ],
        ),
      ),
    );
  }
}
