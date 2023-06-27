import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myroute/constants/constant.dart';
import 'package:myroute/features/PassengerBookingFlow/global_file/global_file.dart';
import 'package:myroute/features/PassengerBookingFlow/view/BottomNavigatorBar.dart';
import 'package:myroute/features/PassengerBookingFlow/view/select_ride_prefences.dart';

class PassengerHome extends StatefulWidget {
  const PassengerHome({super.key});

  @override
  State<PassengerHome> createState() => _PassengerHomeState();
}

class _PassengerHomeState extends State<PassengerHome> {
  TextEditingController whereEditingController = TextEditingController();
  TextEditingController goingToEditingController = TextEditingController();
  TextEditingController whenEditingController = TextEditingController();
  TextEditingController howManyEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Swicher(),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelecteCar(),
                ));
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
                backgroundColor: AppColor.whiteColor,
                radius: 20,
                child: Icon(
                  Icons.menu,
                  color: AppColor.blackColor,
                  size: 15,
                )),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
                backgroundColor: AppColor.whiteColor,
                radius: 20,
                child: Icon(
                  Icons.notifications,
                  color: AppColor.blackColor,
                  size: 15,
                )),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: size.height * 0.6,
              width: size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  AppImage.city,
                ),
                fit: BoxFit.fill,
              )),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Container(
              height: size.height * 0.35,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: AppColor.whiteColor,
              ),
              child: SingleChildScrollView(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    GlobaltextField(
                        keyboardType: TextInputType.none,
                        u: true,
                        controller: whereEditingController,
                        preficIcon: const Icon(Icons.radio_button_checked),
                        label: "Where are you leaving From"),
                    const SizedBox(
                      height: 20,
                    ),
                    GlobaltextField(
                        keyboardType: TextInputType.none,
                        u: true,
                        controller: goingToEditingController,
                        preficIcon: const Icon(
                          Icons.location_on,
                          color: Colors.green,
                        ),
                        label: "Where are you going to?"),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: size.width * 0.42,
                          child: GlobaltextField(
                              keyboardType: TextInputType.none,
                              u: true,
                              controller: whenEditingController,
                              preficIcon: const Icon(Icons.calendar_month),
                              label: "When are you going"),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: size.width * 0.42,
                          child: GlobaltextField(
                              keyboardType: TextInputType.none,
                              u: true,
                              controller: howManyEditingController,
                              preficIcon: const Icon(Icons.person),
                              label: "How many Seats?"),
                        )
                      ],
                    )
                  ],
                ),
              )),
            ),
          )
        ],
      ),

    );
  }
}