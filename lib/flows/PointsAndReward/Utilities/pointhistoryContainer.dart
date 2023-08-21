import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/app_color.dart';
import '../../../constants/app_image.dart';
import '../../../constants/textstyle.dart';

class PointHistory extends StatelessWidget {

  final maintext;
  final text;
  final void Function()? onpressed;
  PointHistory({this.maintext, this.text, this.onpressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: grey1,

        borderRadius: BorderRadius.all(Radius.circular(5)),
          // border: Border(
          //     top: BorderSide(
          //       width: 1.0,
          //       color: grey,
          //     )
          // )
      ),
      height: size.height*0.09,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(maintext, style: body3(black, TextDecoration.none),),
                  Text(text),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child:  SvgPicture.asset(fluentreward, height: 30, width: 30, ),
          ),
        ],
      ),
    );;
  }
}