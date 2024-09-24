import 'package:flutter/material.dart';

class HistoryNav extends StatefulWidget {
  const HistoryNav({super.key});
  static const routeName = '/history';

  @override
  State<HistoryNav> createState() => _HistoryNavState();
}

class _HistoryNavState extends State<HistoryNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            padding: EdgeInsets.only(left: 20, right: 20, top: 90),
            color: Color(0XFF9EDEA1),
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.only(top: 10, bottom: 70),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    //Text('${index + 1} التاريخ')
                    title: Text(getCurrentDate()),
                    subtitle: Container(
                      width: 310,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Color(0xFFF6F4EE),
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        'حصلت على 20 من 20 في التّحدّي اليومي',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  String getCurrentDate() {
    var date = DateTime.now().toString();
    print(DateTime.now().toString());
    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    return formattedDate.toString();
  }
}
