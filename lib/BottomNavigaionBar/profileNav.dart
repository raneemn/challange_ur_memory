import 'package:challenge_ur_memory/models/userInfo.dart';
import 'package:challenge_ur_memory/widgets/edit_userData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileNav extends StatefulWidget {
  const ProfileNav({super.key});
  static const routeName = '/profileNav';

  @override
  State<ProfileNav> createState() => _ProfileNavState();
}

class _ProfileNavState extends State<ProfileNav> {
  List<userInfo> usersDataList = [];
  userInfo currentUser = userInfo();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference userDataCollection =
        FirebaseFirestore.instance.collection('userData');
    String? currentUserEmail = FirebaseAuth.instance.currentUser!.email;

    return FutureBuilder<QuerySnapshot>(
        future: userDataCollection
            .where('email', isEqualTo: currentUserEmail)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              usersDataList.add(userInfo.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              body: Column(
                children: [
                  Container(
                    height: 380,
                    width: double.infinity,
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 70),
                    color: const Color(0XFF9EDEA1),
                    child: Column(children: [
                      Container(
                        width: 351,
                        height: 250,
                        padding: const EdgeInsets.only(top: 10),
                        margin: const EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: const Color(0xFFFBBC43),
                              child: CircleAvatar(
                                radius: 47,
                                backgroundColor: const Color(0xFFD9D9D9),
                                backgroundImage:
                                    usersDataList[0].image != 'none'
                                        ? NetworkImage(usersDataList[0].image)
                                        : AssetImage('assets/images/person.png')
                                            as ImageProvider,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 120,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0xFFFBBC43), width: 2),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    usersDataList[0].fName,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                Container(
                                  width: 120,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0xFFFBBC43), width: 2),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    usersDataList[0].country,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.only(
                                            bottom: 7, top: 7),
                                        child: Image.asset(
                                            'assets/images/Star.png')),
                                    Container(
                                        //margin: EdgeInsets.only(top: 13),
                                        child: Text(
                                      usersDataList[0].totalScore.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF6F6969)),
                                    )),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset('assets/images/location.png'),
                                    const Text(
                                      '1',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF6F6969)),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset('assets/images/world.png'),
                                    const Text(
                                      '15',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF6F6969)),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.all(20),
                      children: [
                        Row(
                          children: [
                            const Text(
                              'عدد الأجزاء التي تحفظها: ',
                              style: TextStyle(
                                  color: Color(0xffFF9900), fontSize: 18),
                            ),
                            Text(
                              usersDataList[0].numOfParts,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            const Text(
                              'الأجزاء: ',
                              style: TextStyle(
                                  color: Color(0xffFF9900), fontSize: 18),
                            ),
                            Text(
                              '${usersDataList[0].selectedParts}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            const Text(
                              'وقت التحدي اليومي: ',
                              style: TextStyle(
                                  color: Color(0xffFF9900), fontSize: 18),
                            ),
                            Text(
                              usersDataList[0].dailyTime,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => EditUserData(
                                      docID: snapshot.data!.docs[0].id,
                                      userData: usersDataList[0])));
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor:
                                  const Color.fromARGB(255, 139, 223, 144),
                            ),
                            child: const Text(
                              'تعديل بياناتك',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
            child: CircularProgressIndicator(),
          );
          }
        });
  }
}
