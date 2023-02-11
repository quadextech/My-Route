import 'package:flutter/material.dart';
import 'package:myroute/constants/constant.dart';

class AppBackButton extends StatelessWidget {
  bool isAppBar;
  AppBackButton({Key? key, this.isAppBar = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              border: Border.all(),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back,
              color: AppColor.blackColor,
            ),
          ),
        ),
      ],
    );
  }
}
