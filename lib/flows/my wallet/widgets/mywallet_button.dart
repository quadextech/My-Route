import 'package:flutter/material.dart';

class MyWalletButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color? color;
  final bool action;

  final double width;
  const MyWalletButton({
    required this.onPressed,
    required this.child,
    Key? key,
    required this.width,
    required this.color, required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: width,
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(30),
            color: color),
        child: Center(child: child),
      ),
    );
  }
}
