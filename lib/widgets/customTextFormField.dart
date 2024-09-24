import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  String? hintText;
  TextEditingController? controller;
  TextInputType? textInputType;
  List<TextInputFormatter>? inputFormatters;
  CustomTextFormField({this.hintText, this.controller,this.inputFormatters,this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
      },
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
            fontSize: 13, color: Color.fromRGBO(116, 116, 116, 1)),
        contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        filled: true,
        fillColor: Colors.grey[300],
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffFF9900)),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffFF9900)),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffFF9900)),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
