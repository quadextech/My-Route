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
        padding: EdgeInsets.all(5),
        child: Center(child: Text('$name', style: TextStyle(color: Colors.black),)),
       
        height: 30,
        decoration: BoxDecoration(
          color: grey4,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
    );
  }
}