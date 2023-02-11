import 'package:flutter/material.dart';

class UpLoadButton extends StatelessWidget {
  const UpLoadButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 130,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), border: Border.all()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.add,
              color: Colors.green,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Upload file")
          ],
        ),
      ),
    );
  }
}
