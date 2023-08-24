import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myroute/constants/app_color.dart';

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
            primarySwatch: myCustomColor,
            fontFamily: "Avenir",
          ),
         

          home: Splash1(),
        );
      }
    );
  }
}