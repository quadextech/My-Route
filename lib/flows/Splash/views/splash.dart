import 'package:flutter/material.dart';
import 'package:myroute/flows/Splash/views/splash2.dart';

import '../../../constants/app_color.dart';
import '../../../constants/app_image.dart';




class Splash1 extends StatefulWidget {


  Splash1({super.key,});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {

  @override


  navigat() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Splash2(),
          ));
    });
  }

  @override

  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: primaryColor,
        body:
        Center(
          child: Container(
              width: 130,
              height: 89.39203643798828,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(appLogo),
                  fit: BoxFit.fitWidth,
                ),
              )),

        )
    );
  }
}