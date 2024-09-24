import 'package:flutter/material.dart';

class sendMailWgt extends StatefulWidget {
  const sendMailWgt({super.key});
  static const routeName = '/settingsWgt';

  @override
  State<sendMailWgt> createState() => _sendMailWgtState();
}

class _sendMailWgtState extends State<sendMailWgt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF9EDEA1),
        title: Text('اقترح لنا'),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                prefixText: 'من:',
                hintText: 'yourEmail@info.com',
                hintTextDirection: TextDirection.ltr,
                hintStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 190, 92), fontSize: 15),
              ),
              style: TextStyle(color: Color(0xffFF9900), fontSize: 15),
              textDirection: TextDirection.ltr,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                prefixText: 'إلى:',
                hintText: 'Email@info.com',
                hintTextDirection: TextDirection.ltr,
                hintStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 190, 92), fontSize: 15),
              ),
              style: TextStyle(color: Color(0xffFF9900), fontSize: 15),
              textDirection: TextDirection.ltr,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                prefixText: 'الموضوع:',
              ),
              style: TextStyle(color: Color(0xffFF9900), fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: 'أكتب هنا اقتراحك ',
                hintStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 190, 92), fontSize: 15),
              ),
              style: TextStyle(color: Color(0xffFF9900), fontSize: 15),
              maxLines: 10,
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 150,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Color(0xff4894DE)),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  child: const Text(
                    'إرسال',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
