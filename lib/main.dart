import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myroute/flows/PointsAndReward/PointAndRewardHome.dart';
import 'package:myroute/flows/my%20wallet/views/mywallet.dart';
import 'package:myroute/flows/my_auto_doc/autodoc_home.dart';
import 'package:myroute/flows/my_autoinsure/autoinsure_homepage.dart';
import 'package:myroute/flows/my_carEarn/my_carEarnHome.dart';
import 'package:myroute/flows/registration/Car_Registration/views/Licensing_details.dart';

import 'flows/Splash/views/splash.dart';


void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
        designSize: const Size(428, 964),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MyRoute',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: "Avenir",
          ),
         

          home: Splash1(),
        );
      }
    );
  }
}