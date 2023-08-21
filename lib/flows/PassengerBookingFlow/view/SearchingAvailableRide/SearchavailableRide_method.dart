import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_color.dart';

class CustomPopUpContainer extends StatelessWidget {
  final double? height;
  final Widget? child;
  final double sizedheight;


  const CustomPopUpContainer({Key? key, this.height, this.child, this.sizedheight = 30}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      height: height,
      child: Column(
        children: [
          SizedBox(height: 10,),
          Container(height: 6, width: 70,  decoration: BoxDecoration(color: grey,borderRadius: BorderRadius.circular(20)),),
          SizedBox(height: sizedheight,),
          Container(
            child: child,
          )

        ],
      ),
    );
  }
}