import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myroute/constants/app_color.dart';

import '../../../constants/app_image.dart';

class PhonecallBox extends StatelessWidget {
  const PhonecallBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemBuilder: (context, index){
        return GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              color: white,
            ),
            height: size.height * 0.13,
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 27,
                      backgroundColor: Colors.red,
                      child: Icon(Icons.supervised_user_circle),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Michael'),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [

                          ],
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),

           SvgPicture.asset(svgcall),
              ],
            ),

          ),
        );
      },
      itemCount: 1,
    );
  }
}