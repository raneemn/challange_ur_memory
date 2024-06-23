import 'package:challenge_ur_memory/home.dart';
import 'package:flutter/material.dart';

class Leading extends StatefulWidget {
  const Leading({super.key});
  static const routeName = '/leading';

  @override
  State<Leading> createState() => _LeadingState();
}

class _LeadingState extends State<Leading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(
            top: 100,
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/Capture.PNG',
                width: 189,
                height: 106,
              ),
              SizedBox(
                height: 30,
              ),
              Stack(
                children: <Widget>[
                  Container(
                    width: 310,
                    height: 230,
                    margin: EdgeInsets.only(bottom: 35),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0XFF9EDEA1),
                        borderRadius: BorderRadius.circular(25)),
                    child: Text(
                      'لا تسمح بأن يضيع جهدك سدىً نحن هنا كي نشد عزمك ونعينك بعد الله عز وجل أن تختبر مستوى حفظك عن طريق التّحديّات اليومية بمستويات عدة',
                      style: TextStyle(
                        fontSize: 23,
                        color: Color(0XFF084319),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    left: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF9900),
                          fixedSize: Size(224, 65),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                          fixedSize: Size(353, 65),
                                          side: BorderSide(
                                              color: Color(0xFF055DB4)),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'تسجيل الدخول بواسطة أبل',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
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
                                          Navigator.pushNamed(
                                            context,
                                            Home.routeName,
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: Size(353, 65),
                                          side: BorderSide(
                                              color: Color(0xFF055DB4)),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'تسجيل الدخول بواسطة جوجل',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
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
                        'ابدأ تحدّي جديد',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 438,
                height: 279,
                margin: EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                    color: Color(0XFF9EDEA1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(180),
                        topRight: Radius.circular(180))),
                child: Container(
                  padding: EdgeInsets.only(top: 25),
                  child: Column(
                    children: [
                      Text(
                        ' لأخبار التّحديثات الجديدة \n وأخبار التّحديّات والأسئلة الجديدة \n ومشاركة منافساتكم واستقبال نصائحكم \n  تابعونا يومياً عبر منصات التواصل الاجتماعي ',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
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
                              child: Image.asset('assets/images/facebook.png')),
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
                              child:
                                  Image.asset('assets/images/instagram.png')),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
