import 'package:flutter/material.dart';

class GlobalAppButton extends StatelessWidget {
  VoidCallback onPressed;
  String label;
  Color buttonColor;
  Color textColor;
  Widget bottonIcon;
  GlobalAppButton({
    this.bottonIcon = const Text(""),
    required this.onPressed,
    required this.label,
    this.buttonColor = Colors.black,
    this.textColor = Colors.white,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(30),
            color: buttonColor),
        child: Center(
          child: Row(
            children: [
              bottonIcon,
              Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
