import 'package:flutter/material.dart';
import 'package:myroute/constants/appColor.dart';

class GlobaltextField extends StatelessWidget {
  String label;
  bool u;
  Widget preficIcon;
  TextInputType keyboardType;

  GlobaltextField(
      {Key? key,
      this.keyboardType = TextInputType.text,
      required this.controller,
      this.u = false,
      required this.preficIcon,
      required this.label})
      : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: AppColor.greyColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: TextField(
            keyboardType: keyboardType,
            controller: controller,
            decoration: InputDecoration(
              hintText: label,
              prefixIcon: u ? preficIcon : null,
              hintStyle: const TextStyle(
                fontSize: 13,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
