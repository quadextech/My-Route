import 'package:flutter/material.dart';
import 'package:myroute/constants/textstyle.dart';

import '../../../constants/app_color.dart';

class GlobalDroptextField extends StatefulWidget {
  final Widget? prificIcon;
  String? selected;
 final List? listTextFied;
final String hint;
final void Function(Object?)? onChanged;

   GlobalDroptextField(
      {this.selected, this.listTextFied, this.prificIcon, this.hint='', this.onChanged, Key? key, })
      : super(key: key);

  // final Widget prificIcon;
  //
  // String? selected;
  // final List? listTextFied;
  //
  // GlobalDroptextField({
  //   this.selected,
  //   this.listTextFied,
  //   required this.prificIcon,
  //   Key? key,
  // }) : super(key: key);

  @override
  State<GlobalDroptextField> createState() => _DroptextFieldState();
}

class _DroptextFieldState extends State<GlobalDroptextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
          color: Color(0xFFEAEAEA), borderRadius: BorderRadius.circular(12), border: null),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: DropdownButtonFormField(
            hint: Text(widget.hint),
            iconDisabledColor: primaryColor,
            iconEnabledColor: primaryColor,
            focusColor: primaryColor,
            value: widget.selected,
            onChanged: widget.onChanged,
            items: widget.listTextFied
                ?.map((e) => DropdownMenuItem(
                      child: Text(e.toString()),
                      value: e,
                    ))
                .toList(),
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                prefixIcon: widget.prificIcon,
                border: InputBorder.none,
               ),
            ),
          ),
        ),
      );
  }
}