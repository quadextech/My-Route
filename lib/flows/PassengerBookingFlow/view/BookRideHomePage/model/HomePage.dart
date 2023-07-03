import "package:flutter/material.dart";
import 'package:myroute/flows/PassengerBookingFlow/global_file/global_file.dart';
import 'package:myroute/flows/PassengerBookingFlow/view/select_car_preferences/select_car_preference.dart';

import '../../../../../constants/app_color.dart';
import '../../../../../constants/app_image.dart';
import '../../SearchingAvailableRide/SearchavailableRide_method.dart';

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

  double _dragSheetExtent = 0.0;

double? contentHeight;

@override
void didChangeDependencies() {
  // TODO: implement initState
  super.didChangeDependencies();
  Future.delayed(Duration(seconds: 6), () {

    showModalBottomSheet(
      context: context,
      builder: (context) => CustomPopUpContainer(
        height: MediaQuery.of(context).size.height * 0.45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(child: Icon(
              Icons.horizontal_rule, size: 70, color: grey,

            )),
            SizedBox(
              height: 7,
            ),

            Column(
              children: [
                GlobaltextField(
                  keyboardType: TextInputType.none,
                  u: true,
                  controller: whereEditingController,
                  preficIcon: const Icon(Icons.radio_button_checked),
                  label: "Where are you leaving From",
                ),
                const SizedBox(height: 20),
                GlobaltextField(
                  keyboardType: TextInputType.none,
                  u: true,
                  controller: goingToEditingController,
                  preficIcon: const Icon(
                    Icons.location_on,
                    color: Colors.green,
                  ),
                  label: "Where are you going to?",
                ),
                const SizedBox(height: 20),

                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: GlobaltextField(
                        keyboardType: TextInputType.none,
                        u: true,
                        controller: whenEditingController,
                        preficIcon: const Icon(Icons.calendar_month),
                        label: "When are you going",
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: GlobaltextField(
                        keyboardType: TextInputType.none,
                        u: true,
                        controller: howManyEditingController,
                        preficIcon: const Icon(Icons.person),
                        label: "How many Seats?",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                )

              ],
            )
          ],
        ),
      ),
      isScrollControlled: true,

    );
  },
  );
}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Swicher(),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SelectCarNow(),
                ));
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
                backgroundColor: white,
                radius: 20,
                child: Icon(
                  Icons.menu,
                  color: black,
                  size: 15,
                )),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
                backgroundColor: white,
                radius: 20,
                child: Icon(
                  Icons.notifications,
                  color: black,
                  size: 15,
                )),
          ),
        ],
      ),
      body: Stack(
        children: [
        Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  city,
                ),
                fit: BoxFit.fill,
              )),
            ),
          
    ]
      ),

    );
  }
}