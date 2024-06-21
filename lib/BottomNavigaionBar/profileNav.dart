import 'package:challenge_ur_memory/models/userInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileNav extends StatefulWidget {
  const ProfileNav({super.key});
  static const routeName = '/profileNav';

  @override
  State<ProfileNav> createState() => _ProfileNavState();
}

class _ProfileNavState extends State<ProfileNav> {
  final GlobalKey<FormState> _key = GlobalKey();
  final timeController = TextEditingController();
  String _fName = '*****';
  String? _email;
  String? _country;
  String? _numOfParts;
  String? _selectedParts;
  String? dailyTime = '';

  userInfo? userData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 345,
            width: double.infinity,
            padding: EdgeInsets.only(left: 20, right: 20, top: 80),
            color: Color(0XFF9EDEA1),
            child: Column(children: [
              Container(
                width: 351,
                height: 230,
                padding: EdgeInsets.only(top: 10),
                margin: EdgeInsets.only(top: 17),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Color(0xFFFBBC43),
                      child: CircleAvatar(
                        radius: 37,
                        backgroundColor: Color(0xFFD9D9D9),
                        child: Image.asset('assets/images/person.png'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 109,
                          height: 32,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xFFFBBC43), width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'رنيم',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          width: 109,
                          height: 32,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xFFFBBC43), width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'الأردن',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                margin: EdgeInsets.only(bottom: 7, top: 7),
                                child: Image.asset('assets/images/Star.png')),
                            Container(
                                //margin: EdgeInsets.only(top: 13),
                                child: Text(
                              '500',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF6F6969)),
                            )),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset('assets/images/location.png'),
                            Text(
                              '1',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF6F6969)),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset('assets/images/world.png'),
                            Text(
                              '15',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
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
          Container(
            width: 370,
            height: 350,
            margin: EdgeInsets.only(
              top: 10,
              right: 20,
              left: 20,
            ),
            padding: EdgeInsets.only(
              right: 20,
              left: 20,
            ),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    child: ListTile(
                      title: const Text('عدد الأجزاء التي تحفظها'),
                      titleTextStyle:
                          TextStyle(color: Color(0xffFF9900), fontSize: 17),
                      subtitle: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp("^([1-9]|[1-2][0-9]|30)\$")),
                        ],
                        style: TextStyle(color: Colors.black, fontSize: 20),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffFF9900)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            hintText: 'ارقام فقط, مثال:5',
                            hintStyle: TextStyle(
                                fontSize: 13,
                                color: Color.fromRGBO(116, 116, 116, 1))),
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
                          TextStyle(color: Color(0xffFF9900), fontSize: 17),
                      subtitle: TextFormField(
                        style: TextStyle(color: Colors.black, fontSize: 20),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffFF9900)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            hintText: 'ارقام فقط, مثال:5',
                            hintStyle: TextStyle(
                                fontSize: 13,
                                color: Color.fromRGBO(116, 116, 116, 1))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'الرجاء إدخال الأجزاء التي تحفظها';
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
                    height: 50,
                    child: ListTile(
                      title: const Text('وقت التحدّي اليومي'),
                      titleTextStyle:
                          TextStyle(color: Color(0xffFF9900), fontSize: 17),
                      subtitle: TextFormField(
                        readOnly: true,
                        controller: timeController,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 10),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffFF9900)),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          hintText: 'حدد الوقت المناسب لك لإنجاز التحدي اليومي',
                          hintStyle: TextStyle(
                            fontSize: 13,
                            color: const Color.fromRGBO(116, 116, 116, 1),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.add_alert,
                              color: const Color(0xffFF9900),
                            ),
                            onPressed: () async {
                              var time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (BuildContext context, Widget? child) {
                                  return Theme(
                                    child: child!,
                                    data: ThemeData.light().copyWith(
                                      colorScheme: ColorScheme.dark(
                                        primary: const Color(0xffE5E0A1),
                                        onPrimary: Colors.black,
                                        surface: Colors.white,
                                        onSurface: Colors.black,
                                      ),
                                      dialogBackgroundColor: Colors.white,
                                    ),
                                  );
                                },
                              );
                              timeController.text = time!.format(context);
                            },
                          ),
                        ),
                        onChanged: (text) {
                          setState(() {
                            dailyTime = text;
                          });
                        },
                        onSaved: (value) {
                          setState(() {
                            dailyTime = value;
                          });
                        },
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          _key.currentState!.save();
                          setState(() {
                            userData = userInfo(
                              numOfParts: _numOfParts!,
                              selectedParts: _selectedParts!,
                              dailyTime: dailyTime!,
                            );
                          });
                          print(userData!.dailyTime);
                          print(userData!.numOfParts);
                          print(userData!.selectedParts);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(100, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Color.fromARGB(255, 139, 223, 144),
                      ),
                      child: const Text(
                        'حفظ',
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
