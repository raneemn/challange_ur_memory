import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:challenge_ur_memory/BottomNavigaionBar/profileNav.dart';
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
  TextEditingController selectedParts = TextEditingController();  

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
    selectedParts.text = widget.userData!.selectedParts.toString();
    dailyTime.text = widget.userData!.dailyTime;
  }

  @override
  Widget build(BuildContext context) {
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
              'selectedParts': selectedParts.text,
              'dailyTime': dailyTime.text,
              'image': url ?? 'none',
            })
            .then((value) => print('userData updated'))
            .catchError((error) => print('Failed to update category: $error'));
      } else {
        print('verified failed');
      }
    }

/*file == null
                        ? Image.asset('assets/images/person.png')
                        : Image.file(file!),*/
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
                'حدّد الأجزاء (أرقام فقط بينهم فواصل)',
                style: TextStyle(color: Color(0xffFF9900), fontSize: 14),
              ),
              CustomTextFormField(
                controller: selectedParts,
                hintText: '${widget.userData!.selectedParts}' ?? '0',
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
