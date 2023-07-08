import 'package:flutter/material.dart';

class mytextField extends StatelessWidget {
  String label;
  bool ispassword;
  bool isobsure;
  TextEditingController controller;
  TextInputType keyboardType;

  mytextField(
      {Key? key,
      this.keyboardType = TextInputType.text,
      required this.controller,
      this.ispassword = false,
      this.isobsure = false,
      required this.label})
      : super(key: key);



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
          child: TextField(
            keyboardType: keyboardType,
            obscureText: isobsure,
            controller: controller,
            decoration: InputDecoration(
              hintText: label,
              suffixIcon: ispassword ? const Icon(Icons.visibility_off) : null,
              hintStyle: const TextStyle(
                fontSize: 18,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
