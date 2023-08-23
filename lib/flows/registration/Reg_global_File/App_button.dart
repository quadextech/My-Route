import 'package:flutter/material.dart';
import 'package:myroute/constants/app_color.dart';
import 'package:myroute/constants/textstyle.dart';

class AppButton extends StatelessWidget {
  VoidCallback onPressed;
  String label;
  Color buttonColor;
  Color? textColor;
  Color borderColor;
  AppButton({
    required this.onPressed,
    required this.label,
    this.buttonColor = Colors.black,
    this.textColor = Colors.white,
    this.borderColor = Colors.black,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(30),
            color: buttonColor),
        child: Center(
          child: Text(
            label,
            style: body3(white, TextDecoration.none)
          ),
        ),
      ),
    );
  }
}
class TransparentAppButton extends StatelessWidget {
  VoidCallback onPressed;
  String label;
  Color buttonColor;
  Color? textColor;
  Color borderColor;
  TransparentAppButton({
    required this.onPressed,
    required this.label,
    this.buttonColor = Colors.black,
    this.textColor = Colors.black,
    this.borderColor = Colors.black,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(30),
            color: buttonColor),
        child: Center(
          child: Text(
            label,
            style: body3(white, TextDecoration.none)
          ),
        ),
      ),
    );
  }
}