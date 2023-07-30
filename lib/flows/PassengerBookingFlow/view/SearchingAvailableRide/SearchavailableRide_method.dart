import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myroute/constants/app_color.dart';

class CustomPopUpContainer extends StatelessWidget {
  final double height;
  final Widget child;

  const CustomPopUpContainer({Key? key, required this.height, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      height: height,
      child: Column(

        children: [
          const SizedBox(height: 10,),
          Center(
            child: Container(
              width: 60,
              height: 5,
              decoration: BoxDecoration(
                  color: grey5, borderRadius: BorderRadius.circular(10)),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
