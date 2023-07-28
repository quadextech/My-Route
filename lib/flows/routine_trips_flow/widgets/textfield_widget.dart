import 'package:flutter/material.dart';
import 'package:myroute/constants/textstyle.dart';

import '../../../constants/app_color.dart';

class RoutineTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  const RoutineTextField(
      {required this.hint, required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(cursorColor: black,
    
      controller: controller,
      decoration: InputDecoration(contentPadding: EdgeInsets.all(20),
        hintText: hint,
        hintStyle: body3(hintColor, TextDecoration.none),
        filled: true,
        fillColor: grey,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
          width: 2,
          color: grey,
        )),
       focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          width: 2,
          color: grey,
        )),
      ),
    );
  }
}