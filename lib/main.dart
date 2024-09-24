import 'package:challenge_ur_memory/Before%20registration/leading.dart';
import 'package:challenge_ur_memory/BottomNavigaionBar/historyNav.dart';
import 'package:challenge_ur_memory/BottomNavigaionBar/homeNav.dart';
import 'package:challenge_ur_memory/BottomNavigaionBar/leaderboardNav.dart';
import 'package:challenge_ur_memory/BottomNavigaionBar/profileNav.dart';
import 'package:challenge_ur_memory/widgets/scoreWidget.dart';
import 'package:challenge_ur_memory/Individual%20challenge/selectPartsWgt.dart';
import 'package:challenge_ur_memory/firebase_options.dart';
import 'package:challenge_ur_memory/home.dart';
import 'package:challenge_ur_memory/sendMail.dart';
import 'package:challenge_ur_memory/widgets/add_userData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChallangeUrMemory());
}

class ChallangeUrMemory extends StatefulWidget {
  const ChallangeUrMemory({super.key});

  @override
  State<ChallangeUrMemory> createState() => _ChallangeUrMemoryState();
}

class _ChallangeUrMemoryState extends State<ChallangeUrMemory> {
  // This widget is the root of your application.

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('============================== User is currently signed out!');
      } else {
        print('============================== User is signed in!');
      }
    });
    super.initState();
  }

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
        AddUserData.routeName: (context) => const AddUserData(),
        Home.routeName: (context) => const Home(),
        ScoreWidget.routeName: (context) => const ScoreWidget(),
        sendMailWgt.routeName: (context) => const sendMailWgt(),        
      },
      home: (FirebaseAuth.instance.currentUser != null) ? Home() : Leading(),
      builder: (context, child) => Directionality(
        textDirection: TextDirection.rtl,
        child: child ?? const SizedBox.shrink(),
      ),
      navigatorKey: navigatorKey,
    );
  }
}
