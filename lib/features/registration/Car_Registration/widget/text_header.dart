import 'package:flutter/material.dart';

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
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subTitle,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
