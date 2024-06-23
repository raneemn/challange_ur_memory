import 'dart:async';
import 'package:challenge_ur_memory/home.dart';
import 'package:challenge_ur_memory/models/model.dart';
import 'package:challenge_ur_memory/models/userInfo.dart';
import 'package:flutter/material.dart';

class Individual extends StatefulWidget {
  const Individual({super.key});
  static const routeName = '/individual';

  @override
  State<Individual> createState() => _IndividualState();
}

class _IndividualState extends State<Individual> {
  late PageController _controller;
  int _questionNumber = 1;
  int _score = 0;
  bool _isLocked = false;
  int timeLeft = 0;
  late Timer timer;
  String selectedParts = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
    _startTimer();
  }

  void _startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        timeLeft++;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    scoreDialog(context, _score, selectedParts);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      selectedParts = ModalRoute.of(context)!.settings.arguments.toString();
    });

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 220,
                color: Color(0xFF9EDEA1),
                padding: EdgeInsets.only(left: 30, right: 30, top: 70),
                margin: EdgeInsets.only(bottom: 535),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 95,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFF084319),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            '$_questionNumber / ${questions.length}',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 22, color: Color(0xFF084319)),
                          ),
                        ),
                        Container(
                          width: 95,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFF084319),
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
                                '00:${timeLeft.toString()}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFF084319)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 25,
                top: 140,
                child: Container(
                    width: 362,
                    height: 570,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 252, 248, 237),
                        borderRadius: BorderRadius.circular(30)),
                    child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _controller,
                        itemCount: questions.length,
                        itemBuilder: (context, index) {
                          final _question = questions[index];

                          return buildQuestion(_question);
                        })),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 200,
                    padding: EdgeInsets.only(top: 15, left: 20, right: 20),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'هل تريد فعلاً إنهاء التّحدّي الآن؟',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xffFF9900),
                                    fixedSize: Size(120, 63),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: Text(
                                  'تابع',
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  dispose();
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff084319),
                                    fixedSize: Size(120, 63),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: Text(
                                  'إنهاء',
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                fixedSize: Size(190, 52),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Text(
              'إنهاء التّحدّي',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Future scoreDialog(BuildContext context, int score, String selectedParts) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Stack(children: [
            AlertDialog(
              backgroundColor: Colors.white,
              alignment: Alignment.center,
              title: Column(
                children: [
                  Text('نتيجتك في تحدّي الجزء'),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(selectedParts),
                  )
                ],
              ),
              titlePadding: EdgeInsets.only(top: 60, left: 60, right: 60),
              content: Text(
                ' $score / ${questions.length} ',
                textAlign: TextAlign.center,
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 70, vertical: 30),
              contentTextStyle: TextStyle(
                fontSize: 40,
                color: Color(0xFFFF9900),
              ),
              actionsAlignment: MainAxisAlignment.center,
              //actionsPadding: EdgeInsets.only(top: 30),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Home.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 131, 201, 135),
                      fixedSize: Size(200, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    'الصفحة الرئيسية',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )
              ],
            ),
            Positioned(
                right: 130,
                top: 160,
                child: Image.asset(
                    width: 150,
                    height: 150,
                    alignment: Alignment.center,
                    'assets/images/StarScore.png'))
          ]);
        });
  }

  Column buildQuestion(Question question) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 200,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xff9EDEA1)),
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            question.text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Color(0xff084319)),
          ),
        ),
        OptionWidget(
            question: question,
            OnClickedOption: (option) {
              question.selectedOption = option;
              if (question.isLocked) {
                return;
              } else {
                setState(() {
                  question.isLocked = true;
                  question.selectedOption = option;
                });
                _isLocked = question.isLocked;
                if (question.selectedOption!.isCorrect) {
                  setState(() {});

                  _score++;
                }
              }
            }),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                _controller.previousPage(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInExpo);
                setState(() {
                  if (_questionNumber == 1) {
                    return null;
                  } else {
                    _questionNumber--;
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF9900),
                  fixedSize: Size(110, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text(
                'السابق',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_questionNumber < questions.length) {
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInExpo);
                  setState(() {
                    _questionNumber++;
                    _isLocked = false;
                  });
                } else {
                  dispose();
                  //scoreDialog(context, _score, selectedParts);
                  //Navigator.pushNamed(context, ScoreWidget.routeName,
                  //  arguments: _score);
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF9900),
                  fixedSize: Size(104, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text(
                _questionNumber < questions.length ? 'التالي' : 'النتيجة',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

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
    final color = getColorForOption(option, question);

    return GestureDetector(
      onTap: () => OnClickedOption(option),
      child: Container(
        height: 50,
        width: 260,
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
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

  Color getColorForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect ? Colors.green : Colors.red;
      } else if (option.isCorrect) {
        return Colors.green;
      }
    }
    return Color(0xff9EDEA1);
  }
}
