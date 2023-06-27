import 'package:flutter/material.dart';

class DroptextField extends StatefulWidget {
  String selected;
  List listTextFied;
  DroptextField({required this.selected, required this.listTextFied, Key? key})
      : super(key: key);

  @override
  State<DroptextField> createState() => _DroptextFieldState();
}

class _DroptextFieldState extends State<DroptextField> {
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
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
