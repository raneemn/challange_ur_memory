import 'package:challenge_ur_memory/Individual%20challenge/individual_challenge.dart';
import 'package:challenge_ur_memory/models/QDB_connect.dart';
import 'package:challenge_ur_memory/models/question_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SelectPartsWgt extends StatefulWidget {
  const SelectPartsWgt({super.key, required this.userDocId, required this.totalScore});
  final String userDocId;
  final int totalScore;
  static const routeName = '/SelectPartWgt';

  @override
  State<SelectPartsWgt> createState() => _SelectPartsWgtState();
}

class _SelectPartsWgtState extends State<SelectPartsWgt> {
  Color color = Colors.white;
  int btnIndex = 88;

  Set<int> selectedParts = {};
  bool Allselected = false;

  List<containerInfo> listOfContainers = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 30; i++) {
      listOfContainers.add(containerInfo(index: i + 1, selected: false));
    }
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'تحدّي فردي',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Color(0xFF084319),
          ),
        ),
      ),
      extendBody: true,
      body: Column(
        children: [
          Container(
            height: 122,
            color: Color(0xFF9EDEA1),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'حدّد الأجزاء التي تريد تحدّي حفظك بها',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          GridView.count(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 20, left: 40, right: 40),
              mainAxisSpacing: 10,
              crossAxisSpacing: 15,
              crossAxisCount: 5,
              children: [
                for (int i = 0; i < 30; i++)
                  InkWell(
                    onTap: () {
                      setState(() {
                        listOfContainers[i].selected =
                            !listOfContainers[i].selected;
                        listOfContainers[i].index = i + 1;
                        if (listOfContainers[i].selected) {
                          selectedParts.add(i + 1);
                        } else if (listOfContainers[i].index == i + 1) {
                          selectedParts.remove(i + 1);
                        }
                        print(selectedParts);
                        //btnIndex = i + 1;
                        //print(listOfContainers[i].index);
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: listOfContainers[i].selected || Allselected
                              ? Color(0xFFFF9900)
                              : Colors.white,
                          border:
                              Border.all(color: Color(0xFF084319), width: 2),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        '${i + 1}',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF084319),
                        ),
                      ),
                    ),
                  ),
              ]),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Checkbox(
                  checkColor: Colors.white,
                  fillColor: WidgetStatePropertyAll(Color(0xFFFF9900)),
                  value: Allselected,
                  onChanged: ((value) {
                    setState(() {
                      Allselected = value!;
                      for (int i = 0; i < 30; i++)
                        if (Allselected) {
                          {
                            selectedParts.add(i + 1);
                          }
                        } else {
                          selectedParts = {};
                          listOfContainers[i].selected = false;
                        }
                      print(selectedParts);
                    });
                  })),
              Text(
                'كل الأجزاء',
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff084319),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              if (selectedParts.isEmpty) {
                final snackBar = SnackBar(
                  //backgroundColor: Colors.black,
                  content: Text(
                    'يجب تحديد جزء واحد على الأقل',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => IndividualChallenge(
                              selectedParts: selectedParts,
                              totalScore: widget.totalScore,
                              userDocId: widget.userDocId,
                            )));
                /*Navigator.pushNamed(
                  context,
                  IndividualChallenge.routeName,
                  arguments: selectedParts as Set<int>,
                );*/
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffFF9900),
                //fixedSize: Size(280, 52),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Text(
              'بسم الله أبدأ التّحدّي',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class containerInfo {
  int index;
  bool selected;

  containerInfo({this.index = 0, this.selected = false});
}
