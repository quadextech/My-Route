import 'package:flutter/material.dart';

import '../../constants/app_color.dart';
import '../../constants/textstyle.dart';

class GridViewButton extends StatelessWidget {

  final Function() onPressed;
  final Border border;
  final String text;

  GridViewButton({required this.onPressed, required this.text, required this.border});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isPotrait = Orientation.portrait == MediaQuery.of(context).orientation;
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(primaryColor),
      ),
      onPressed: onPressed,
      child: Container(
        height: isPotrait ? size.height*0.042 : size.height*0.1,
        width: size.width*0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: border,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: isPotrait ? body3(black, TextDecoration.none) : body2(black, TextDecoration.none),),
            SizedBox(width: 10,),
            Icon(Icons.arrow_forward, size: isPotrait ? 17 : 23, color: black,),
          ],
        ),
      ),
    );
  }
}