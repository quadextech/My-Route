import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'flows/PassengerBookingFlow/view/BookRideHomePage/model/homepageUI.dart';
import 'flows/PointsAndReward/PointAndRewardHome.dart';
import 'flows/my_auto_doc/auto_doc_setting/auto_doc_settings.dart';
import 'flows/my_auto_doc/homescreen.dart';
import 'flows/my_auto_doc/pay_renewal_fee.dart';
import 'flows/my_auto_save/auto_save_details.dart';
import 'flows/my_auto_save/auto_save_home_screen.dart';
import 'flows/my_autoinsure/autoinsure_homepage.dart';
import 'flows/my_carEarn/my_carEarnHome.dart';
import 'flows/my_carEarn/rent_a_car/select_car_to_rent.dart';
import 'flows/my_carEarn/rent_out_mycar_screen.dart';
import 'flows/registration/Do_you_have_car/views/do_you_have_a_car.dart';
import 'flows/registration/login/views/login_sreen.dart';
import 'flows/trips_history/Trips_History.dart';


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
      home: PointAndRewardHome (),
    );
  }
}