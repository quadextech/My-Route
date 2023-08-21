import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';
import '../../../constants/textstyle.dart';

class DroptextField extends StatelessWidget {
  String hintText;
  String? selected;
  List listTextFied;
  final ValueChanged<dynamic> onChanged;
  final String error;
  final errorCondition;
  DroptextField(
      {required this.onChanged,
      this.selected,
      required this.listTextFied,
      required this.hintText,
      required this.error,
      required this.errorCondition,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: errorCondition ? Colors.red : black),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: DropdownButtonFormField(
                hint: Text(hintText),
                value: selected,
                onChanged: onChanged,
                items: listTextFied
                    .map((e) => DropdownMenuItem(
                          child: Text(e.toString()),
                          value: e,
                        ))
                    .toList(),
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        if (errorCondition)
          Text(
            error,
            style: body4(Colors.red, TextDecoration.none),
          )
      ],
    );
  }
}