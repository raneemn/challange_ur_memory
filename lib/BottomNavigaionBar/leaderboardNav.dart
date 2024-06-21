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
    userInfo(fName: 'رنيم', score: 500),
    userInfo(fName: 'جواد', score: 470),
    userInfo(fName: 'مريم', score: 450),
    userInfo(fName: 'عائشة', score: 430),
    userInfo(fName: 'مصطفى', score: 400),
    userInfo(fName: 'لجين', score: 390),
    userInfo(fName: 'عبدالله', score: 388),
    userInfo(fName: 'سائد', score: 377),
    userInfo(fName: 'سلوى', score: 350),
    userInfo(fName: 'فاطمة', score: 346),
  ];
  List<userInfo> worldUsersData = [
    userInfo(fName: 'منيرة', score: 1500),
    userInfo(fName: 'عبدالله', score: 1470),
    userInfo(fName: 'سلمى', score: 1450),
    userInfo(fName: 'يزن', score: 1430),
    userInfo(fName: 'محمد', score: 1400),
    userInfo(fName: 'عمران', score: 1390),
    userInfo(fName: 'غفران', score: 1388),
    userInfo(fName: 'رحمة', score: 1377),
    userInfo(fName: 'مها', score: 1350),
    userInfo(fName: 'رقية', score: 1346),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 345,
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
                        width: 90,
                        height: 33,
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
                            fontSize: 20,
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
                        width: 90,
                        height: 33,
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
                            fontSize: 20,
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
                                radius: 50,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 47,
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
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF084319)),
                          ),
                          Text(
                            btnTapped
                                ? worldUsersData[1].score.toString()
                                : countryUsersData[1].score.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
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
                                radius: 50,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 47,
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
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF084319)),
                          ),
                          Text(
                            btnTapped
                                ? worldUsersData[0].score.toString()
                                : countryUsersData[0].score.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
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
                                radius: 50,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 47,
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
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF084319)),
                          ),
                          Text(
                           btnTapped
                                ? worldUsersData[2].score.toString()
                                : countryUsersData[2].score.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
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
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xFFF6F2F2),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: Text(
                      '${index + 4} ',
                      style: TextStyle(
                          color: Color(0xFF2479CD),
                          fontSize: 14,
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
                    trailing: Text(
                      btnTapped
                                ? worldUsersData[index + 3].score.toString()
                                : countryUsersData[index + 3].score.toString(),
                      style: TextStyle(
                          color: Color(0xFF4FA3F6),
                          fontSize: 14,
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
