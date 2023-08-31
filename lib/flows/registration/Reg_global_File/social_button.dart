import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final Widget image;
 final VoidCallback onPressed;
 const SocialButton({
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
