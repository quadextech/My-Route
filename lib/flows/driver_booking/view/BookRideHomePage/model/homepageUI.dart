import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myroute/flows/PassengerBookingFlow/view/BookRideHomePage/model/HomePage.dart';

import '../../../../../constants/app_color.dart';
import '../../../../../constants/app_image.dart';
import '../../../../conversations/conversations_screen.dart';
import '../../../../trips_history/Trips_History.dart';
import '../../select_car_preferences/models/select_car_prefence_template.dart';

class DriverHomeScreen extends StatefulWidget {
  final String name;
  const DriverHomeScreen({Key? key, required this.name}) : super(key: key);

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  int _index = 0;
  late List pages = [
     PassengerHome(name:widget.name),
    const SelectedCar(),
    const Center(child: Text("Routine Trips")),
    const TripHistory(),
    const Conversations(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        fixedColor: primaryColor,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.location_on,
                color: _index == 0 ? primaryColor : null,
              ),
              label: "Map"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                svgsmallcar,
                color: _index == 1 ? primaryColor : null,
              ),
              label: "Book Ride"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                svgsroutine,
                color: _index == 2 ? primaryColor : null,
              ),
              label: "Routine Rides"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                svgmyRides,
                color: _index == 3 ? primaryColor : null,
              ),
              label: "My Rides"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                svgConversations,
                color: _index == 4 ? primaryColor : null,
              ),
              label: "Conversations"),
        ],
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
      ),
    );
  }
}