import 'package:flutter/material.dart';
import 'package:myroute/constants/textstyle.dart';

class TextHeader extends StatelessWidget {
  String title;
  String subTitle;
  TextHeader({
    this.title = "Car Registration: ",
    required this.subTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subTitle,
          style: body2(Colors.grey.shade600, TextDecoration.none)
        )
      ],
    );
  }
}
