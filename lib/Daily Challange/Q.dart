import 'package:challenge_ur_memory/home.dart';
import 'package:challenge_ur_memory/models/model.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({super.key});
  static const routeName = '/question';

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int _questionNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 220,
                color: Color(0xFF9EDEA1),
                padding: EdgeInsets.only(left: 20, right: 20, top: 70),
                margin: EdgeInsets.only(bottom: 160),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                                '01:00',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFF084319)),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '$_questionNumber / ${questions.length}',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF084319)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Wrap(
                      alignment: WrapAlignment.end,
                      spacing: 5,
                      runSpacing: 5,
                      runAlignment: WrapAlignment.end,
                      children: [
                        for (int i = 0; i < 20; i++)
                          Container(
                            width: 28,
                            height: 5,
                            margin: EdgeInsets.only(left: 2),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3)),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 25,
                top: 170,
                child: Container(
                  width: 362,
                  height: 200,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 252, 248, 237),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      'قال تعالى: \n ( إنّ الّذين كفروا سواءٌ عليهم أأنذرتهم أم لم تنذرهم ............... )',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff084319)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 362,
            height: 330,
            padding: EdgeInsets.only(
              top: 10,
              left: 15,
              right: 15,
            ),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 252, 248, 237),
                borderRadius: BorderRadius.circular(30)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff9EDEA1),
                      fixedSize: Size(260, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Text(
                    'لا يهتدون',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff9EDEA1),
                      fixedSize: Size(260, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Text(
                    'لا يؤمنون',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff9EDEA1),
                      fixedSize: Size(260, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Text(
                    'لا يكفرون',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff9EDEA1),
                      fixedSize: Size(260, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Text(
                    'لا يستوون',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF9900),
                          fixedSize: Size(104, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text(
                        'التالي',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff084319),
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
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 220,
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
                            'إذا أنهيت التّحدي الآن فلن تستطيع الدّخول إليه مرّة أخرى, لكن سيتم تجديده لك كل يوم في الوقت المحدّد مسبقاً.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, Home.routeName);
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
                              )
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
}
