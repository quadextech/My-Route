import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';

class GlobalDroptextField extends StatefulWidget {
  Widget prificIcon;
  String? selected;
  List? listTextFied;

  GlobalDroptextField(
      {this.selected,
      this.listTextFied,
      required this.prificIcon,

      Key? key})
      : super(key: key);

  @override
  State<GlobalDroptextField> createState() => _DroptextFieldState();
}

class _DroptextFieldState extends State<GlobalDroptextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: grey,
        borderRadius: BorderRadius.circular(12),
        border: null

      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: DropdownButtonFormField(
            iconDisabledColor: primaryColor,
            iconEnabledColor: primaryColor,
            focusColor: primaryColor,
            value: widget.selected,
            onChanged: (value) {
              setState(() {
                widget.selected = value as String;
              });
            },
            items: widget.listTextFied
                ?.map((e) => DropdownMenuItem(
                      child: Text(e.toString()),
                      value: e,
                    ))
                .toList(),
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              prefixIcon: widget.prificIcon,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}