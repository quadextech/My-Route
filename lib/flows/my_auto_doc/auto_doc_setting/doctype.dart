import 'package:flutter/material.dart';
import 'package:myroute/constants/app_color.dart';

class CarDoc extends StatelessWidget {
  final String? name;
  final void Function()? onPressed;

  const CarDoc({this.onPressed, this.name});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        child: Center(child: Text('$name', style: TextStyle(color: Colors.black),)),
        width: 100,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}