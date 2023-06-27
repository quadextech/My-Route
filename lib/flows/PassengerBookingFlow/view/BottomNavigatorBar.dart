import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myroute/constants/constant.dart';
import 'package:myroute/flows/PassengerBookingFlow/view/HomePage.dart';

class BottomNav extends StatefulWidget {
  BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _index = 0;

  List pages = [
    const PassengerHome(),
    const Center(child: Text("Routine")),
    const Center(child: Text("my Ride")),
    const Center(child: Text("Conversations")),
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
              icon: SvgPicture.asset(
                svgsmallcar,
                color: _index == 0 ? primaryColor : null,
              ),
              label: "Book Ride"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                svgsroutine,
                color: _index == 1 ? primaryColor : null,
              ),
              label: "Routine Rides"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                svgmyRides,
                color: _index == 2 ? primaryColor : null,
              ),
              label: "My Rides"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                svgConversations,
                color: _index == 3 ? primaryColor : null,
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
