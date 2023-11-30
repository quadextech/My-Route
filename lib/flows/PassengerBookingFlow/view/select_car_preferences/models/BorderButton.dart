import 'package:flutter/material.dart';

import '../../../../../constants/app_color.dart';

class BorderButton extends StatelessWidget {

  final void Function()? onTap;
  final IconData? icons;
  final double? size;
  final Color? color;
  final Color? backgroundColor;

  const BorderButton({super.key, required this.onTap, required this.icons, required this.size, this.color, required this.backgroundColor});

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
            icons,
            color: color,
            size: size,
          )),
    );
  }
}