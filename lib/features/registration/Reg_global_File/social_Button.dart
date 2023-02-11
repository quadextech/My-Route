import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  Widget image;
  VoidCallback onPressed;
  SocialButton({
    required this.image,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 100,
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(child: image),
      ),
    );
  }
}
