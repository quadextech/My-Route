import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:myroute/flows/onboarding/onboarding.dart';
import 'package:myroute/flows/registration/login/views/login_sreen.dart';

import '../../../Map/map.dart';
import '../../../Map/map_shared_prefs.dart';
import '../../../constants/app_image.dart';
import 'package:flutter_map/flutter_map.dart';





class Splash2 extends StatefulWidget {

  Splash2({super.key});

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  @override
  void initState() {
    super.initState();
    //nav();
  }


  nav() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => LoginScreen())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body:
        Center(
          child: Container(
              width: 130,
              height: 89.39203643798828,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(appLogo2),
                  fit: BoxFit.fitWidth,
                ),
              )),
        )
    );
  }
}