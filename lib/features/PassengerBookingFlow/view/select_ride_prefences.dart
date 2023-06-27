import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myroute/constants/constant.dart';
import 'package:myroute/features/PassengerBookingFlow/global_file/global_file.dart';
import 'package:myroute/features/registration/Reg_global_File/dropTextField.dart';

class SelecteCar extends StatefulWidget {
  const SelecteCar({super.key});

  @override
  State<SelecteCar> createState() => _SelecteCarState();
}

class _SelecteCarState extends State<SelecteCar> {
  TextEditingController currentMapController = TextEditingController();
  TextEditingController goingToEditingController = TextEditingController();
  String _selected = 'Ikeja - Ikorodu way';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
                backgroundColor: AppColor.whiteColor,
                radius: 10,
                child: Icon(
                  Icons.arrow_back,
                  color: AppColor.blackColor,
                  size: 15,
                )),
          ),
        ),
        title: Text("Select Ride Prefrences"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Text("Journey details"),
          GlobaltextField(
              controller: currentMapController,
              preficIcon: const Icon(Icons.radio_button_checked),
              label: "Current map location (Ikeja Lagos)"),
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
          Text("What’s your preferred route?"),
          GlobalDroptextField(
              prificIcon: SvgPicture.asset(AppImage.svgroute),
              selected: _selected,
              listTextFied: const [
                'Ikeja - Ikorodu way',
                "Ikeja - Express way",
                "Ibadan Express way",
                "BolaLe Street",
              ]),
          Text('What time are you going?'),
          GlobalDroptextField(
              prificIcon: Icon(Icons.calendar_month),
              selected: _selected,
              listTextFied: const [
                'Ikeja - Ikorodu way',
                "Ikeja - Express way",
                "Ibadan Express way",
                "BolaLe Street",
              ]),
        ],
      )),
    );
  }
}
