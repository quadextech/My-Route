import 'package:flutter/material.dart';

class UpLoadButton extends StatelessWidget {
  final VoidCallback onPressed;
  const UpLoadButton({
    Key? key, required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 130,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), border: Border.all()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              color: Colors.green,
            ),
            SizedBox(
              height: 10,
            ),
            Text("Upload file")
          ],
        ),
      ),
    );
  }
}