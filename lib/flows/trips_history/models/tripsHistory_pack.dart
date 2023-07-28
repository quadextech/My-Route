import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myroute/constants/app_color.dart';

import '../../../constants/app_image.dart';

class Package extends StatelessWidget {
  const Package({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
        itemBuilder: (context, index){
      return Container(
        padding: EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: white,
              child: SvgPicture.asset(mdicarsports),
            ),
            Container(
              color: null,
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(svgmyCurrentLocation),
                    Text('from'),
                  ],
                ),

               Row(
                 children: [
                   SizedBox(
                     width: 20,
                   ),
                   Text('Lekki Lagos'),
                 ],
               ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.green,
                    ),
                    Text('To'),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text('Ikorodu Lagos'),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text('6th February, 2023, 7:00pm'),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text('Passebgers: Jennifer, jacob'),
                  ],
                ),
              ],
            ),
            Container(
              color: null,
              width: 65,
            ),
            Center(
              child: Row(
                children: [
                Image.asset(money),
                  Text("£300"),
                ],
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: grey,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        height: size.height * 0.23,
      );
    },
      itemCount: 1,
    );
  }
}