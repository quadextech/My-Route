import 'package:flutter/material.dart';
import 'package:myroute/constants/constant.dart';
import 'package:myroute/features/Splash/views/slash2.dart';

class Splash1 extends StatefulWidget {
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  @override
  void initState() {
    super.initState();
    navigat();
  }

  navigat() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Splash2(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: Center(
          child: Container(
              width: 130,
              height: 89.39203643798828,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImage.appLogo),
                  fit: BoxFit.fitWidth,
                ),
              )),
        ));
  }
}