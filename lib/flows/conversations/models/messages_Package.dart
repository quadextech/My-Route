import 'package:flutter/material.dart';
import 'package:myroute/constants/app_color.dart';

import '../../../constants/textstyle.dart';

class MessagesBox extends StatelessWidget {
  const MessagesBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemBuilder: (context, index) {
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
                        Text(
                          'Michael',
                          style: body2(black),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Hello, where are you right now?',
                          style: body3(hintColor),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '10:10',
                      style: body3(primaryColor),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: primaryColor,
                      child: Text(
                        '1',
                        style: body3(white),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
      itemCount: 1,
    );
  }
}
