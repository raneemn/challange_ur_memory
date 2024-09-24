import 'package:challenge_ur_memory/constants.dart';
import 'package:challenge_ur_memory/home.dart';
import 'package:challenge_ur_memory/models/QDB_connect.dart';
import 'package:challenge_ur_memory/models/question_model.dart';
import 'package:challenge_ur_memory/widgets/next_button.dart';
import 'package:challenge_ur_memory/widgets/option_card.dart';
import 'package:challenge_ur_memory/widgets/question_wgt.dart';
import 'package:challenge_ur_memory/widgets/result_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class IndividualChallenge extends StatefulWidget {
  const IndividualChallenge(
      {super.key, required this.selectedParts, required this.totalScore, required this.userDocId});
  final Set<int> selectedParts;
  final int totalScore;
  final String userDocId;
  static const routeName = 'IndividualChallenge';

  @override
  State<IndividualChallenge> createState() => _IndividualChallengeState();
}

class _IndividualChallengeState extends State<IndividualChallenge> {
  var db = QDBconnect();
  late Future _questions;

  Future<List<Question>> getQuestion() async {
    return await db.fetchQuestionByParts(widget.selectedParts);
  }

  CollectionReference userDataCollection =
      FirebaseFirestore.instance.collection('userData');

  Future<void> updateScore(int totalScore) async {
    await userDataCollection
        .doc(widget.userDocId)
        .update({'totalScore': totalScore + score})
        .then((value) => print('Score updated'))
        .catchError((error) => print('Failed to update Score: $error'));
  }

  int score = 0;
  //index to loop questions
  int index = 0;
  //boolean value for check if the user clicked
  bool isPressed = false;
  bool isAlreadySelected = false;

  Set<int> selectedParts = {};

  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      updateScore(widget.totalScore);
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => ResultBox(
              result: score, questionLength: questionLength, onTap: startOver));
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'اختر الإجابة لتنتقل إلى السؤال التالي',
            textAlign: TextAlign.center,
          ),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 10),
        ));
      }
    }
  }

  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pushNamedAndRemoveUntil(
        context, Home.routeName, (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    _questions = getQuestion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _questions as Future<List<Question>>,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            var extractData = snapshot.data as List<Question>;

            return Scaffold(
              floatingActionButton: GestureDetector(
                onTap: () {
                  nextQuestion(extractData.length);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: NextButton(),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              body: Column(
                children: [
                  Container(
                    height: 130,
                    color: lightGreen,
                    padding: EdgeInsets.only(left: 30, right: 30, top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: darkGreen,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            '${index + 1}/${extractData.length}',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 22, color: Color(0xFF084319)),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: darkGreen,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.timer_outlined,
                                color: Color(0xFF084319),
                              ),
                              Text(
                                '00:00',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFF084319)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: 200,
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: darkGreen),
                          borderRadius: BorderRadius.circular(20)),
                      child: QuestionWidget(
                        question: extractData[index].title,
                      )),
                  for (int i = 0; i < extractData[index].options.length; i++)
                    GestureDetector(
                      onTap: () => checkAnswerAndUpdate(
                          extractData[index].options.values.toList()[i]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: OptionCard(
                          option: extractData[index].options.keys.toList()[i],
                          color: isPressed
                              ? extractData[index].options.values.toList()[i] ==
                                      true
                                  ? correctColor
                                  : incorrectColor
                              : lightGreen,
                        ),
                      ),
                    ),
                ],
              ),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return const Center(
          child: Text('No Data'),
        );
      },
    );
  }
}
