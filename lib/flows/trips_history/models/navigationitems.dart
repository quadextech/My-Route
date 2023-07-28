import 'package:flutter/material.dart';

import '../../../constants/textstyle.dart';


class MyRidesContainer extends StatelessWidget {
  final color;
  final textName;
  final textColor;
  const MyRidesContainer({this.textName, this.color, this.textColor});
//wrap container with textbutton
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(textName, style: body3(textColor, TextDecoration.none),
          ),
      ),
      height: 40,
      width: 95,
      decoration:
      BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30)
      ),
    );
  }
}