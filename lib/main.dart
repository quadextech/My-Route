import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myroute/flows/registration/AddPayment/views/addPayment.dart';
import 'package:myroute/flows/registration/Add_ProficPic/views/add_profile_pic.dart';
import 'package:myroute/flows/registration/Car_Registration/views/payment_detail.dart';
import 'package:myroute/flows/registration/Forotten_password/views/forgotten_password.dart';
import 'package:myroute/flows/registration/SignUp/views/Sign_up.dart';

import 'flows/registration/Add_ProficPic/views/add_profile_pic.dart';
import 'flows/registration/Car_Registration/views/car_details_reg.dart';
import 'flows/registration/login/views/login_sreen.dart';


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
      home: AddProfilePic(),
    );
  }
}