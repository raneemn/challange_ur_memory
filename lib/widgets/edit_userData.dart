import 'dart:io';
import 'package:challenge_ur_memory/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:path/path.dart';
import 'package:challenge_ur_memory/home.dart';
import 'package:challenge_ur_memory/models/userInfo.dart';
import 'package:challenge_ur_memory/widgets/customTextFormField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class EditUserData extends StatefulWidget {
  final userInfo? userData;
  final String? docID;
  const EditUserData({super.key, required this.userData, required this.docID});
  static const routeName = 'EditUserData';

  @override
  State<EditUserData> createState() => _EditUserDataState();
}

class _EditUserDataState extends State<EditUserData> {
  final GlobalKey<FormState> _key = GlobalKey();

  TextEditingController dailyTime = TextEditingController();
  TextEditingController fName = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController numOfParts = TextEditingController();

  final List<int> parts = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30
  ];
  List<int> selected = [];
  final controller = MultiSelectController<int>();
  String oldSelected = '';

  File? file;
  String? url;

  getImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? imageGallery =
        await picker.pickImage(source: ImageSource.gallery);
    if (imageGallery != null) {
      file = File(imageGallery!.path);
      var imageName = basename(imageGallery.path);
      var refStorage = FirebaseStorage.instance.ref('images').child(imageName);
      await refStorage.putFile(file!);
      url = await refStorage.getDownloadURL();
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    url = widget.userData!.image;
    fName.text = widget.userData!.fName;
    country.text = widget.userData!.country;
    numOfParts.text = widget.userData!.numOfParts;
    oldSelected = widget.userData!.selectedParts.toString();
    dailyTime.text = widget.userData!.dailyTime;
    
  }

  @override
  Widget build(BuildContext context) {
    final items =
        parts.map((e) => DropdownItem(label: '$e', value: e)).toList();
    CollectionReference userDataCollection =
        FirebaseFirestore.instance.collection('userData');

    Future<void> updateUserData() async {
      if (_key.currentState!.validate()) {
        await userDataCollection
            .doc(widget.docID)
            .update({
              'firstName': fName.text,
              'country': country.text,
              'numOfParts': numOfParts.text,
              'selectedParts': selected.toString(),
              'dailyTime': dailyTime.text,
              'image': url ?? 'none',
            })
            .then((value) => print('userData updated'))
            .catchError((error) => print('Failed to update category: $error'));
      } else {
        print('verified failed');
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _key,
          child: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  getImage();
                },
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: const Color(0xFFFBBC43),
                  child: CircleAvatar(
                    radius: 78,
                    backgroundColor: const Color(0xFFD9D9D9),
                    backgroundImage: url != 'none'
                        ? NetworkImage(url!)
                        : AssetImage('assets/images/person.png')
                            as ImageProvider,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'اسمك',
                style: TextStyle(color: Color(0xffFF9900), fontSize: 14),
              ),
              CustomTextFormField(
                controller: fName,
                hintText: widget.userData!.fName ?? 'اسمك أو لقبك',
              ),
              const SizedBox(
                height: 7,
              ),
              const Text(
                'بلدك:',
                style: TextStyle(color: Color(0xffFF9900), fontSize: 14),
              ),
              CustomTextFormField(
                controller: country,
                hintText: widget.userData!.country ?? 'بلدك',
              ),
              const SizedBox(
                height: 7,
              ),
              const Text(
                'عدد الأجزاء التي تحفظها (أرقام فقط من 1-30)',
                style: TextStyle(color: Color(0xffFF9900), fontSize: 14),
              ),
              CustomTextFormField(
                controller: numOfParts,
                hintText: widget.userData!.numOfParts ?? '0',
                textInputType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(
                      RegExp("^([1-9]|[1-2][0-9]|30)\$")),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              const Text(
                'الأجزاء',
                style: TextStyle(color: Color(0xffFF9900), fontSize: 14),
              ),
              MultiDropdown<int>(
                items: items,
                controller: controller,
                enabled: true,
                chipDecoration: const ChipDecoration(
                  backgroundColor: lightGreen,
                  wrap: true,
                ),
                fieldDecoration: FieldDecoration(
                  hintText: oldSelected,
                  hintStyle: const TextStyle(
                      fontSize: 13, color: Color.fromRGBO(116, 116, 116, 1)),
                  showClearIcon: false,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xffFF9900)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xffFF9900),
                    ),
                  ),
                ),
                dropdownItemDecoration: const DropdownItemDecoration(
                  selectedIcon: Icon(Icons.check_box, color: Color(0xffFF9900)),
                ),
                onSelectionChange: (selectedItems) {
                  debugPrint("OnSelectionChange: $selectedItems");
                  setState(() {
                    selected = selectedItems;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يجب تحديد جزء واحد على الأقل';
                  }
                  return null;
                },
              ),              
              SizedBox(
                height: 7,
              ),
              const Text(
                'وقت التحدّي اليومي',
                style: TextStyle(color: Color(0xffFF9900), fontSize: 14),
              ),
              TextFormField(
                readOnly: true,
                controller: dailyTime,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffFF9900)),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffFF9900)),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  hintText: widget.userData!.dailyTime ?? '00:00',
                  hintStyle: const TextStyle(
                    fontSize: 13,
                    color: Color.fromRGBO(116, 116, 116, 1),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.add_alert,
                      color: Color(0xffFF9900),
                    ),
                    onPressed: () async {
                      var time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            child: child!,
                            data: ThemeData.light().copyWith(
                              colorScheme: const ColorScheme.dark(
                                primary: Color(0xffE5E0A1),
                                onPrimary: Colors.black,
                                surface: Colors.white,
                                onSurface: Colors.black,
                              ),
                              dialogBackgroundColor: Colors.white,
                            ),
                          );
                        },
                      );
                      setState(() {
                        dailyTime!.text = time!.format(context);
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      _key.currentState!.save();
                      updateUserData();
                      Navigator.pushNamedAndRemoveUntil(
                          context, Home.routeName, (route) => false);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: const Color.fromARGB(255, 139, 223, 144),
                  ),
                  child: const Text(
                    'حفظ',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
