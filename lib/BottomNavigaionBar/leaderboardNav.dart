import 'package:challenge_ur_memory/models/userInfo.dart';
import 'package:flutter/material.dart';

class LeaderBoardNav extends StatefulWidget {
  const LeaderBoardNav({super.key});
  static const routeName = '/leaderboardNav';
  @override
  State<LeaderBoardNav> createState() => _LeaderBoardNavState();
}

class _LeaderBoardNavState extends State<LeaderBoardNav> {
  bool btnTapped = false;
  List<userInfo> countryUsersData = [
    userInfo(fName: 'إيمان', totalScore: 500),
    userInfo(fName: 'جواد', totalScore: 470),
    userInfo(fName: 'مريم', totalScore: 450),
    userInfo(fName: 'عائشة', totalScore: 430),
    userInfo(fName: 'مصطفى', totalScore: 400),
    userInfo(fName: 'لجين', totalScore: 390),
    userInfo(fName: 'عبدالله', totalScore: 388),
    userInfo(fName: 'سائد', totalScore: 377),
    userInfo(fName: 'سلوى', totalScore: 350),
    userInfo(fName: 'فاطمة', totalScore: 346),
  ];
  List<userInfo> worldUsersData = [
    userInfo(fName: 'منيرة', totalScore: 1500),
    userInfo(fName: 'عبدالله', totalScore: 1470),
    userInfo(fName: 'سلمى', totalScore: 1450),
    userInfo(fName: 'يزن', totalScore: 1430),
    userInfo(fName: 'محمد', totalScore: 1400),
    userInfo(fName: 'عمران', totalScore: 1390),
    userInfo(fName: 'غفران', totalScore: 1388),
    userInfo(fName: 'رحمة', totalScore: 1377),
    userInfo(fName: 'مها', totalScore: 1350),
    userInfo(fName: 'رقية', totalScore: 1346),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 310,
            padding: EdgeInsets.only(left: 20, right: 20, top: 90),
            color: Color(0XFF9EDEA1),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          btnTapped = !btnTapped;
                        });
                      },
                      child: Container(
                        width: 70,
                        height: 25,
                        decoration: BoxDecoration(
                          color:
                              btnTapped ? Color(0xFFCEEDD0) : Color(0xFFFBBC43),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                        ),
                        child: Text(
                          'دولتك',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          btnTapped = !btnTapped;
                        });
                      },
                      child: Container(
                        width: 70,
                        height: 25,
                        decoration: BoxDecoration(
                          color:
                              btnTapped ? Color(0xFFFBBC43) : Color(0xFFCEEDD0),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                        ),
                        child: Text(
                          'العالم',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 37,
                                  backgroundColor: Color(0xFF9EDEA1),
                                  child:
                                      Image.asset('assets/images/person.png'),
                                ),
                              ),
                              Positioned(
                                  right: -8,
                                  child: Image.asset(
                                      'assets/images/GroupStar2.png'))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            btnTapped
                                ? worldUsersData[1].fName
                                : countryUsersData[1].fName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF084319)),
                          ),
                          Text(
                            btnTapped
                                ? worldUsersData[1].totalScore.toString()
                                : countryUsersData[1].totalScore.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF084319)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 37,
                                  backgroundColor: Color(0xFF9EDEA1),
                                  child:
                                      Image.asset('assets/images/person.png'),
                                ),
                              ),
                              Positioned(
                                  right: -8,
                                  child: Image.asset(
                                      'assets/images/GroupStar1.png'))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            btnTapped
                                ? worldUsersData[0].fName
                                : countryUsersData[0].fName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF084319)),
                          ),
                          Text(
                            btnTapped
                                ? worldUsersData[0].totalScore.toString()
                                : countryUsersData[0].totalScore.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF084319)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 37,
                                  backgroundColor: Color(0xFF9EDEA1),
                                  child:
                                      Image.asset('assets/images/person.png'),
                                ),
                              ),
                              Positioned(
                                  right: -8,
                                  child: Image.asset(
                                      'assets/images/GroupStar3.png'))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            btnTapped
                                ? worldUsersData[2].fName
                                : countryUsersData[2].fName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF084319)),
                          ),
                          Text(
                            btnTapped
                                ? worldUsersData[2].totalScore.toString()
                                : countryUsersData[2].totalScore.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF084319)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(
                  top: 10, left: 20, right: 20, bottom: 100),
              itemCount: 7,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  width: 370,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color(0xFFF6F2F2),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    isThreeLine: true,
                    leading: Text(
                      '${index + 4} ',
                      style: TextStyle(
                          color: Color(0xFF2479CD),
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    title: Text(
                      btnTapped
                          ? worldUsersData[index + 3].fName
                          : countryUsersData[index + 3].fName,
                      style: TextStyle(
                          color: Color(0xFFFBBC43),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: SizedBox(
                      height: 30,
                    ),
                    trailing: Text(
                      btnTapped
                          ? worldUsersData[index + 3].totalScore.toString()
                          : countryUsersData[index + 3].totalScore.toString(),
                      style: TextStyle(
                          color: Color(0xFF4FA3F6),
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
