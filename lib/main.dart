import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'flows/PassengerBookingFlow/view/BookRideHomePage/model/homepageUI.dart';
import 'flows/registration/AddPayment/views/addPayment.dart';
import 'flows/registration/Forotten_password/views/forgotten_password.dart';


void main() {
  runApp(ProviderScope(child: const MyApp()));
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

      home: PassengerHomeScreen(),
    );
  }
}