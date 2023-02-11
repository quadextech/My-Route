import 'package:flutter/material.dart';
import 'package:myroute/constants/constant.dart';
import 'package:myroute/features/onboarding/onboarding.dart';

class Splash2 extends StatefulWidget {
  const Splash2({super.key});

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  @override
  void initState() {
    super.initState();
    nav();
  }

  nav() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => const OnBoarddinngScreeen())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: Center(
          child: Container(
              width: 130,
              height: 89.39203643798828,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImage.appLogo2),
                  fit: BoxFit.fitWidth,
                ),
              )),
        ));
  }
}
