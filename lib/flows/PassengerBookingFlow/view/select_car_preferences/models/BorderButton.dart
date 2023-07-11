import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_color.dart';

class BorderButton extends StatelessWidget {

  final void Function()? onTap;
  final IconData? Icons;
  final double? size;
  final Color? color;
  final Color? backgroundColor;

  const BorderButton({Key? key, required this.onTap, required this.Icons, required this.size, this.color, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 0.3,
              color: black,
            ),
            color: backgroundColor,
          ),
          child: Icon(
            Icons,
            color: color,
            size: size,
          )),
    );
  }
}