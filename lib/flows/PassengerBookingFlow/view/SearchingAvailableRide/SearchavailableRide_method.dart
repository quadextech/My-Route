import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myroute/constants/app_color.dart';

import '../../../../constants/app_color.dart';

class CustomPopUpContainer extends StatelessWidget {

  final double? height;
  final Widget? child;
  final double sizedheight;


  const CustomPopUpContainer({Key? key, this.height, this.child, this.sizedheight = 30}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      height: height,
      child: Column(
        children: [
          SizedBox(height: 10,),
          Container(height: 6, width: 70,  decoration: BoxDecoration(color: grey1,borderRadius: BorderRadius.circular(20)),),
          SizedBox(height: sizedheight,),
          Container(
            child: child,
          )
        // children: [
        //   const SizedBox(height: 10,),
        //   Center(
        //     child: Container(
        //       width: 60,
        //       height: 5,
        //       decoration: BoxDecoration(
        //           color: grey5, borderRadius: BorderRadius.circular(10)),
        //     ),
        //   ),
        //   child,
         ],
      )
    );
  }
}