import 'package:flutter/material.dart';
import 'package:myroute/constants/app_color.dart';
import 'package:myroute/constants/textstyle.dart';

class mytextField extends StatefulWidget {
  String label;
  bool ispassword;
  bool isobsure;
  TextEditingController controller;
  TextInputType keyboardType;
  final String error;
  final FocusNode? focusNode;
  bool? isFocused;
  final errorCondition;

  mytextField(
      {Key? key,
      this.keyboardType = TextInputType.text,
      required this.controller,
      this.ispassword = false,
      this.isobsure = false,
      required this.label,
      required this.error,
      this.isFocused = false,
      this.errorCondition,
      this.focusNode})
      : super(key: key);

  @override
  State<mytextField> createState() => _mytextFieldState();
}

class _mytextFieldState extends State<mytextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border:
                Border.all(color: widget.errorCondition ? Colors.red : black),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: TextField(
                focusNode: widget.focusNode,
                onChanged: (_) {
                  setState(() {
                    widget.isFocused = false;
                  });
                },
                keyboardType: widget.keyboardType,
                obscureText: widget.isobsure,
                controller: widget.controller,
                decoration: InputDecoration(
                    hintText: widget.label,
                    suffixIcon: widget.ispassword
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                widget.isobsure = !widget.isobsure;
                              });
                            },
                            icon: Icon(
                                widget.isobsure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                //color: grey1,
                                size: 15))
                        : null,
                    hintStyle: const TextStyle(
                      fontSize: 18,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20)),
              ),
            ),
          ),
        ),
        if (widget.errorCondition)
          Text(
            widget.error,
            style: body4(Colors.red),
          )
      ],
    );
  }
}
