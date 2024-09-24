import 'package:challenge_ur_memory/Individual%20challenge/individual_challenge.dart';
import 'package:challenge_ur_memory/constants.dart';
import 'package:flutter/material.dart';

class DailyInfo extends StatefulWidget {
  const DailyInfo(
      {super.key, required this.selectedParts, required this.totalScore, required this.userDocId});
  final Set<int> selectedParts;
  final int totalScore;
  final String userDocId;
  static const routeName = '/dailyInfo';

  @override
  State<DailyInfo> createState() => _DailyInfoState();
}

class _DailyInfoState extends State<DailyInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 130,
            color: lightGreen,
            padding: EdgeInsets.only(left: 30, right: 30, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'التّحدّي اليومي',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF084319)),
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
                        '01:00',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFF084319)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 330,
            height: 490,
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 252, 248, 237),
                borderRadius: BorderRadius.circular(30)),
            child: Text(
              "تحدّى حفظك يوميّاً\nكل يوم تُراجع فيه وردك وتكرره هو بمثابة ترسيخ وتثبيت لكل ما تتلوه رسوخاً ثابتاً في قلبك وذاكرتك بعون الله وتوفيقه\n من هنا جاءت فكرة التّحدّي اليومي, بعد ما تنهي وردك اليومي من المراجعة والحفظ اختمه بتحدٍّ سريع واختبر جودة حفظك ثمّ دوّن الأخطاء -إن وجدت- في مصحفك الخاص لتتفاداها في وردك القادم \nالتّحدّي اليومي عبارة عن 20 سؤال خلال  60 ثانية, يتم اختيار الأسئلة عشوائيا كل يوم بناءا على عدد الأجزاء التي حدّدتها مسبقاً\n\n عند إتمامك لحفظ جزء جديد قم بتعديل عدد الأجزاء وحدّد الجزء الجديد في حسابك الشخصي",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff084319)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => IndividualChallenge(
                            selectedParts: widget.selectedParts,
                            totalScore: widget.totalScore,
                            userDocId: widget.userDocId,
                          )));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffFF9900),
                fixedSize: Size(280, 30),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Text(
              'بسم الله أبدأ التّحدّي',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
