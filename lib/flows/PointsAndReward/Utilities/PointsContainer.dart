import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';
import '../../../constants/app_image.dart';
import '../../../constants/textstyle.dart';

class PointsContainer extends StatelessWidget {
  final maintext;
  final text;
  final void Function()? onpressed;
 PointsContainer({this.maintext, this.text, this.onpressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1.0,
            color: grey,
          )
        )
      ),
      height: size.height*0.09,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Image.asset(reward, height: 40, width: 40,),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(maintext, style: headline2(black),),
                    Text(text),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: onpressed,
                child: Icon(Icons.arrow_forward_ios_outlined, color: primaryColor, size: 17,)),
          ),
        ],
      ),
    );
  }
}