import 'package:flutter/material.dart';
import 'package:myroute/flows/Splash/views/splash.dart';
import 'package:myroute/flows/onboarding/onboarding.dart';
import 'package:date_format/date_format.dart';
import 'package:myroute/flows/routine_trips_flow/create_routine_ride.dart';
import 'features/onboarding/onboarding.dart';
import 'flows/PassengerBookingFlow/view/BookRideHomePage/BookRideHomePage.dart';
import 'package:provider/provider.dart';

import 'flows/routine_trips_flow/create_routine_trip.dart';


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
      home: CreateRoutineTrip(),
    );
  }
}