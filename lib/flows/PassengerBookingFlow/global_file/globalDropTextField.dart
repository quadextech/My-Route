import 'package:flutter/material.dart';

class GlobalDroptextField extends StatefulWidget {
  Widget prificIcon;
  String selected;
  List listTextFied;
  GlobalDroptextField(
      {required this.selected,
      required this.listTextFied,
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
        borderRadius: BorderRadius.circular(12),
        border: Border.all(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: DropdownButtonFormField(
            value: widget.selected,
            onChanged: (value) {
              setState(() {
                widget.selected = value as String;
              });
            },
            items: widget.listTextFied
                .map((e) => DropdownMenuItem(
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
