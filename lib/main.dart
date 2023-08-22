import 'package:flutter/material.dart';
import 'package:myroute/features/PassengerBookingFlow/view/BottomNavigatorBar.dart';
import 'package:myroute/features/Splash/views/Slash.dart';
import 'package:myroute/features/registration/Forotten_password/views/forgotten_password.dart';

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
      home: ForgetPassword(),
    );
  }
}
