import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_image.dart';
import 'models/select_car_prefence_template.dart';



class SelectCarNow extends StatefulWidget {
  const SelectCarNow({Key? key}) : super(key: key);

  @override
  State<SelectCarNow> createState() => _SelectCarNowState();
}

class _SelectCarNowState extends State<SelectCarNow> {


  int _index = 0;
  List pages = [
    const SelectedCar(),
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