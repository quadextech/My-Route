import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPopUpContainer extends StatelessWidget {
  final double? height;
  final Widget? child;


  const CustomPopUpContainer({Key? key, this.height, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      height: height,
      child: child,
    );
  }
}