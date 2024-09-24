import 'package:challenge_ur_memory/home.dart';
import 'package:challenge_ur_memory/widgets/add_userData.dart';
import 'package:challenge_ur_memory/widgets/edit_userData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Leading extends StatefulWidget {
  const Leading({super.key});
  static const routeName = '/leading';

  @override
  State<Leading> createState() => _LeadingState();
}

class _LeadingState extends State<Leading> {
  bool isLoading = false;

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    setState(() {
      isLoading = true;
    });
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      setState(() {
        isLoading = false;
      });
      return;
    }
    // Obtain the auth details from the request
    // final GoogleSignInAuthentication? googleAuth =  await googleUser?.authentication;
    GoogleSignInAuthentication? googleSignInAuthentication =
        await (await GoogleSignIn(
      scopes: ["profile", "email"],
    ).signIn())
            ?.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,
    );

    // Once signed in, return the UserCredential
    var result = await FirebaseAuth.instance.signInWithCredential(credential);
    print(result.user!.email);
    String? userEmail = result.user!.email;
    setState(() {
      isLoading = false;
    });
    Navigator.pushNamedAndRemoveUntil(
        context, AddUserData.routeName, (Route<dynamic> route) => false,
        arguments: userEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: ListView(
                padding: EdgeInsets.only(
                  top: 100,
                ),
                children: [
                  Image.asset(
                    'assets/images/Capture.PNG',
                    width: 189,
                    height: 110,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          width: 290,
                          height: 160,
                          margin: EdgeInsets.only(bottom: 35),
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 20),
                          decoration: BoxDecoration(
                              color: Color(0XFF9EDEA1),
                              borderRadius: BorderRadius.circular(25)),
                          child: Text(
                            'لا تسمح بأن يضيع جهدك سدىً نحن هنا كي نشد عزمك ونعينك بعد الله عز وجل أن تختبر مستوى حفظك عن طريق التّحديّات اليومية بمستويات عدة',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0XFF084319),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 90,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFF9900),
                              fixedSize: Size(200, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 370,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const Text(
                                          'تسجيل الدخول',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF055DB4)),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          'أهلاً بك \n قم بتسجيل الدخول لتحافظ على مستوى تقدّمك ',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w800,
                                              color: Color(0xFF6F6969)),
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        OutlinedButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                context,
                                                Home.routeName,
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              fixedSize: Size(340, 65),
                                              side: BorderSide(
                                                  color: Color(0xFF055DB4)),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  'بواسطة حسابك في Apple',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFF055DB4)),
                                                ),
                                                Image.asset(
                                                    'assets/images/appleLogo.png'),
                                              ],
                                            )),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        OutlinedButton(
                                            onPressed: () {
                                              signInWithGoogle();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              fixedSize: Size(340, 65),
                                              side: BorderSide(
                                                  color: Color(0xFF055DB4)),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  'بواسطة حسابك في Google',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFF055DB4)),
                                                ),
                                                Image.asset(
                                                    'assets/images/googleLogo.png'),
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Text(
                            'ابدأ التحدّي الآن',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 438,
                    height: 350,
                    margin: EdgeInsets.only(top: 50),
                    decoration: BoxDecoration(
                        color: Color(0XFF9EDEA1),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(180),
                            topRight: Radius.circular(180))),
                    child: Padding(
                      padding: EdgeInsets.only(top: 35),
                      child: Column(
                        children: [
                          Text(
                            ' لأخبار التّحديثات الجديدة \n وأخبار التّحديّات والأسئلة الجديدة \n ومشاركة منافساتكم واستقبال نصائحكم \n  تابعونا يومياً عبر منصات التواصل الاجتماعي ',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: Color(0xFFFF9900), width: 5)),
                                  child: Image.asset(
                                      'assets/images/facebook.png')),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.asset(
                                      'assets/images/instagram.png')),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
