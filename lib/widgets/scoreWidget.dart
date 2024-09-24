import 'package:challenge_ur_memory/home.dart';

import 'package:flutter/material.dart';

class ScoreWidget extends StatefulWidget {
  const ScoreWidget({super.key});
  static const routeName = '/scoreWidget';

  @override
  State<ScoreWidget> createState() => _ScoreWidgetState();
}

class _ScoreWidgetState extends State<ScoreWidget> {
  @override
  Widget build(BuildContext context) {
    final score = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      body: Center(
        child: Container(
            width: 362,
            height: 565,
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 252, 248, 237),
                borderRadius: BorderRadius.circular(30)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'درجتك في تحدّي اليوم',
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 133,
                  height: 80,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff084319)),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      '$score',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 50, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffFBBC43),
                      ),
                      child: Center(
                        child: Text(
                          ' 20 \n سؤال',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff60F46F),
                      ),
                      child: Center(
                        child: Text(
                          '$score \n صحيح',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffFF4D4D),
                      ),
                      child: Center(
                        child: Text(
                          '${20 - score} \n خاطئ',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Home.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF9900),
                      fixedSize: Size(204, 50),
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
            )),
      ),
    );
  }
}
