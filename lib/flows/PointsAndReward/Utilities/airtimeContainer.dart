import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/app_color.dart';
import '../../../constants/app_image.dart';
import '../../../constants/textstyle.dart';

class AirtimeContainer extends StatelessWidget {
  final maintext;
  final points;
  final airtime;
  AirtimeContainer({this.airtime, this.maintext, this.points,});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
      color: grey1,
          borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      height: size.height*0.1,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Container(
                child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(maintext, style: body3(black, TextDecoration.none)),
                        Text(points,  style: headline4(black),),
                      ],
                    ),

              ),
            ),
      SvgPicture.asset(chevron ),

            Container(
              width: size.width*0.4,
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("You'll get", style: body3(black, TextDecoration.none)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(airtime,  style: headline4(black),),

                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text('airtime'),
                      ),
                    ],
                  )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}