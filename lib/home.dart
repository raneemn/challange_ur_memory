import 'package:after_layout/after_layout.dart';
import 'package:challenge_ur_memory/Before%20registration/leading.dart';
import 'package:challenge_ur_memory/BottomNavigaionBar/historyNav.dart';
import 'package:challenge_ur_memory/BottomNavigaionBar/homeNav.dart';
import 'package:challenge_ur_memory/BottomNavigaionBar/leaderboardNav.dart';
import 'package:challenge_ur_memory/BottomNavigaionBar/profileNav.dart';
import 'package:challenge_ur_memory/Daily%20Challange/dailyInfo.dart';
import 'package:challenge_ur_memory/models/userInfo.dart';
import 'package:challenge_ur_memory/sendMail.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const routeName = '/home';
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AfterLayoutMixin<Home> {
  final GlobalKey<FormState> _key2 = GlobalKey();

  String _fName = '*****';
  String? _email;
  String? _country;
  String? _numOfParts;
  String? _selectedParts;

  userInfo? userData;
  userInfo? userData2 = userInfo(fName: '***');
  List<userInfo> allUsers = [];

  int _score = 0;

  List<Widget> _drawerOptions = [
    HomeNav(),
    LeaderBoardNav(),
    HistoryNav(),
    ProfileNav(),
  ];
  List<String> _title = [
    'تحدّى حفظك',
    'قائمة المتصدّرين',
    'التّحدّيات السابقة',
    'حسابك الشخصي',
  ];
  List<String> menuItems = [
    'الصفحة الرئيسية',
    'المتصدّرين',
    'التّحديات السابقة',
    'حسابك الشخصي',
    'تابعنا على فيسبوك',
    'تابعنا على انستغرام',
    'اقترح لنا',
    'تسجيل خروج ',
  ];
  List<IconData> menuIcons = [
    Icons.home_outlined,
    Icons.leaderboard_outlined,
    Icons.history_outlined,
    Icons.person,
    Icons.facebook_outlined,
    Icons.photo_camera_outlined,
    Icons.mail_outlined,
    Icons.logout_outlined
  ];

  int _currentIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void afterFirstLayout(BuildContext context) {
    //_firstTimeDialog();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _score = 10;
  }

 

  @override
  Widget build(BuildContext context) {
   
   

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ),
        title: Center(
          child: Text(
            _title[_currentIndex],
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFF084319),
            ),
          ),
        ),
        actions: [
          Builder(builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.notifications_outlined,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {},
            );
          }),
        ],
      ),
      drawer: Drawer(
          backgroundColor: Color(0XFF9EDEA1),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 50,
                ),
                width: double.infinity,
                height: 60,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFFFBBC43),
                    child: CircleAvatar(
                      radius: 26,
                      backgroundColor: Color(0xFFD9D9D9),
                      child: Image.asset('assets/images/person.png'),
                    ),
                  ),
                  title: Text(
                    'رنيم',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  trailing: Container(
                    height: 50,
                    width: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/Star.png'),
                        Text(
                          '$_score',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                endIndent: 20,
                indent: 20,
                color: Colors.white,
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 8,
                    padding: EdgeInsets.only(right: 20),
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (index < 4) {
                            _onItemTapped(index);
                            Navigator.pop(context);
                          } else if (index == 6) {
                            Navigator.pushNamed(context, sendMailWgt.routeName);
                          } else if (index == 7) {
                            Navigator.pushNamed(context, Leading.routeName);
                          } else
                            Navigator.pop(context);
                        },
                        child: Container(
                          height: 56,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Icon(
                                menuIcons[index],
                                size: 40,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                menuItems[index],
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      );
                    })),
              )
            ],
          )),
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        child: BottomAppBar(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 70,
          color: Color(0xFFFF9900),
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                iconSize: 35,
                icon: const Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  _onItemTapped(0);
                },
              ),
              IconButton(
                iconSize: 35,
                icon: const Icon(
                  Icons.leaderboard_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  _onItemTapped(1);
                },
              ),
              SizedBox(
                width: 20,
              ),
              IconButton(
                iconSize: 35,
                icon: const Icon(
                  Icons.history_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  _onItemTapped(2);
                },
              ),
              IconButton(
                iconSize: 35,
                icon: const Icon(
                  Icons.person_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  _onItemTapped(3);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, DailyInfo.routeName);
        },
        backgroundColor: Color(0xFFFF9900),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Container(
            margin: EdgeInsets.all(5),
            child: Image.asset('assets/images/24hour.png')),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _drawerOptions[_currentIndex],
    );
  }
/*
  Future<void> _firstTimeDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('يُرجى إكمال كافّة البيانات بالشكل الصحيح'),
            titleTextStyle: TextStyle(
                color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
            content: Center(
              child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: _key2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 50,
                        child: ListTile(
                          title: const Text('اسمك أو لقبك'),
                          titleTextStyle:
                              TextStyle(color: Color(0xff055DB4), fontSize: 17),
                          subtitle: TextFormField(
                            style: TextStyle(
                                color: Color(0xffFF9900), fontSize: 20),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff055DB4)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'الرجاء تزويدنا بإسمك أو لقبك';
                              } else if (value.length <= 2) {
                                return 'قصير جداً, يجب أن يحتوي على 3 حروف أو أكثر';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _fName = value!;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: ListTile(
                          title: const Text('البريد الإلكتروني'),
                          titleTextStyle:
                              TextStyle(color: Color(0xff055DB4), fontSize: 17),
                          subtitle: TextFormField(
                            style: TextStyle(
                                color: Color(0xffFF9900), fontSize: 17),
                            textDirection: TextDirection.ltr,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff055DB4)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              hintText: 'yourEmail@info.com',
                              hintTextDirection: TextDirection.ltr,
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 255, 190, 92),
                                  fontSize: 17),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'الرجاء تزويدنا ببريدك الإلكتروني';
                              } else if (!EmailValidator.validate(value)) {
                                return 'الرجاء إدخال بريد إلكتروني فعّال';
                              }

                              return null;
                            },
                            onSaved: (value) {
                              _email = value!;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: ListTile(
                          title: const Text('الدولة'),
                          titleTextStyle:
                              TextStyle(color: Color(0xff055DB4), fontSize: 17),
                          subtitle: TextFormField(
                            style: TextStyle(
                                color: Color(0xffFF9900), fontSize: 20),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff055DB4)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'الرجاء إدخال الدولة التي تقيم بها ';
                              } else if (value.length <= 2) {
                                return 'قصير جداً, يجب أن يحتوي على 3 حروف أو أكثر';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _country = value!;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: ListTile(
                          title: const Text('عدد الأجزاء التي تحفظها'),
                          titleTextStyle:
                              TextStyle(color: Color(0xff055DB4), fontSize: 17),
                          subtitle: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            style: TextStyle(
                                color: Color(0xffFF9900), fontSize: 20),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff055DB4)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'الرجاء إدخال عدد الأجزاء التي تحفظها';
                              } else if (int.parse(value) < 1 ||
                                  int.parse(value) > 30) {
                                return 'عدد أجزاء القرآن 1-30';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _numOfParts = value!;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: ListTile(
                          title: const Text('حدّد الأجزاء'),
                          titleTextStyle:
                              TextStyle(color: Color(0xff055DB4), fontSize: 17),
                          subtitle: TextFormField(
                            style: TextStyle(
                                color: Color(0xffFF9900), fontSize: 20),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff055DB4)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              hintText: '1,2,3,4,5',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 255, 190, 92),
                                  fontSize: 17),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'الرجاء تحديد الأجزاء التي تحفظها كأرقام بينها فواصل';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _selectedParts = value!;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_key2.currentState!.validate()) {
                                _key2.currentState!.save();
                                userData = userInfo(
                                  fName: _fName!,
                                  email: _email!,
                                  country: _country!,
                                  numOfParts: _numOfParts!,
                                  selectedParts: _selectedParts!,
                                );

                                allUsers.add(userData!);
                                print(userData);
                                Navigator.pop(context, userData);
                                //Navigator.pushNamed(context, SignIn.routeName,
                                // arguments: UserClass(allUsers!));
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll(
                                  Color(0xff4894DE)),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                            child: const Text(
                              'حفظ',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  )),
            ),
          );
        });
   
  }*/
}
