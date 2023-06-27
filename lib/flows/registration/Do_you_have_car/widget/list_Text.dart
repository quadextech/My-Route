import 'package:flutter/material.dart';
import 'package:myroute/constants/constant.dart';

class ListText extends StatelessWidget {
  int number;
  String label;
  ListText({
    required this.number,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            color: primaryColor,
            shape: BoxShape.circle,
          ),
          child: Center(
              child: Text(
            "${number}",
            style: TextStyle(
                fontSize: 16,
                color: white,
                fontWeight: FontWeight.bold),
          )),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            label,
            overflow: TextOverflow.clip,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
