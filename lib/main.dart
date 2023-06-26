import 'package:flutter/material.dart';
import 'package:myroute/features/Splash/views/splash.dart';
import 'package:myroute/features/onboarding/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyRoute',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Avenir",
      ),
      home: OnboardingScreen(),
    );
  }
}
