import 'package:challenge_ur_memory/Individual%20challenge/selectPartsWgt.dart';
import 'package:flutter/material.dart';

class HomeNav extends StatefulWidget {

  const HomeNav({super.key});
  static const routeName = '/homeNav';

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  String name = 'رنيم';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 211,
                  margin: EdgeInsets.only(bottom: 115),
                  padding: EdgeInsets.only(left: 20, right: 20, top: 90),
                  decoration: BoxDecoration(
                      color: Color(0XFF9EDEA1),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(37),
                          bottomRight: Radius.circular(37))),
                  child: Column(
                    children: [
                      Text(
                        'أهلاً بك',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFF9900),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 50,
                    right: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, SelectPartsWgt.routeName);
                          },
                          child: Container(
                            width: 138,
                            height: 143,
                            padding: EdgeInsets.only(top: 5, right: 10),
                            decoration: BoxDecoration(
                                color: Color(0xFFFF9900),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ' تحدّي \n فردي',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 65),
                                  child: Image.asset(
                                      'assets/images/play_circle_wgite 1.png'),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 138,
                          height: 143,
                          padding: EdgeInsets.only(top: 5, right: 10),
                          decoration: BoxDecoration(
                              color: Color(0xFFFF9900),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                ' تحدّي \n جماعي',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 65),
                                child: Image.asset(
                                    'assets/images/play_circle_wgite 1.png'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ))
              ],
            ),
            Expanded(
              child: Container(
                width: 351,
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(top: 35, left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Color(0XFF9EDEA1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(90),
                        topRight: Radius.circular(90))),
                child: Text(
                  'هدف التّحديّات هنا هي قياس درجة إتقانك في الحفظ عن طريق الأسئلة المتنوعة. \n تعينك هذه التّحديّات على كشف مواطن الضّعف لديك لِتعمل أنت بعد ذلك على تقويتها بالمراجعة اليومية والتكرار لِتصل إلى درجة الماهر في القرآن الكريم بعون الله -عزَّ وجلَّ- وتوفيقه.  \n نودّ تذكيرك بأنه مجرّد تحدّي فلتكن نظرتك للدرجة التّي تحصّلها على أنّها بوّابة للتثبيت والاستمرار وليست للتقاعس أو الغرور, \n  أخلص النيّة واستعن بالله ولا تعجِز.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 19, color: Color(0xFF084319)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
/*selectedItemColor: Color(0XFF4CAF50),
              //backgroundColor: Color(0xFFFF9900),
              iconSize: 25,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outlined,
                    color: Colors.white,
                  ),
                  label: '',
                  backgroundColor: Color(0xFFFF9900),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.history_outlined,
                    color: Colors.white,
                  ),
                  label: '',
                  backgroundColor: Color(0xFFFF9900),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.leaderboard_outlined,
                    color: Colors.white,
                  ),
                  label: '',
                  backgroundColor: Color(0xFFFF9900),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                  ),
                  label: '',
                  backgroundColor: Color(0xFFFF9900),
                ),
              ],*/