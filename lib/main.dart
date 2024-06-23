import 'package:challenge_ur_memory/Before%20registration/leading.dart';
import 'package:challenge_ur_memory/BottomNavigaionBar/historyNav.dart';
import 'package:challenge_ur_memory/BottomNavigaionBar/homeNav.dart';
import 'package:challenge_ur_memory/BottomNavigaionBar/leaderboardNav.dart';
import 'package:challenge_ur_memory/BottomNavigaionBar/profileNav.dart';
import 'package:challenge_ur_memory/Daily%20Challange/dailyInfo.dart';
import 'package:challenge_ur_memory/Daily%20Challange/questionWidget.dart';
import 'package:challenge_ur_memory/Daily%20Challange/scoreWidget.dart';
import 'package:challenge_ur_memory/Individual%20challenge/individual.dart';
import 'package:challenge_ur_memory/Individual%20challenge/selectPartsWgt.dart';
import 'package:challenge_ur_memory/home.dart';
import 'package:challenge_ur_memory/sendMail.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChallangeUrMemory());
}

class ChallangeUrMemory extends StatelessWidget {
  const ChallangeUrMemory({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Leading.routeName: (context) => const Leading(),
        HomeNav.routeName: (context) => const HomeNav(),
        LeaderBoardNav.routeName: (context) => const LeaderBoardNav(),
        HistoryNav.routeName: (context) => const HistoryNav(),
        ProfileNav.routeName: (context) => const ProfileNav(),
        Home.routeName: (context) => const Home(),
        DailyInfo.routeName: (context) => const DailyInfo(),
        QuestionWidget.routeName: (context) => const QuestionWidget(),
        ScoreWidget.routeName: (context) => const ScoreWidget(),
        SelectPartsWgt.routeName: (context) => const SelectPartsWgt(),
        sendMailWgt.routeName: (context) => const sendMailWgt(),
        Individual.routeName :(context)=> const Individual(),
      },
      home: Leading(),
      builder: (context, child) => Directionality(
        textDirection: TextDirection.rtl,
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}
