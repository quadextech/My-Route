import 'package:flutter/material.dart';
import 'package:myroute/constants/constant.dart';
import 'package:myroute/flows/registration/Reg_global_File/drop_textfield.dart';
import 'package:myroute/flows/registration/Reg_global_File/globalFile.dart';

import '../../../../constants/app_image.dart';
import '../widget/text_header.dart';
import 'Licensing_details.dart';

class CarDetailsReg extends StatefulWidget {
  CarDetailsReg({super.key});

  @override
  State<CarDetailsReg> createState() => _CarDetailsRegState();
}

class _CarDetailsRegState extends State<CarDetailsReg> {
  TextEditingController referralCodeController = TextEditingController();

  TextEditingController plateNumbercontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Image.asset(
          appLogo2,
          width: 120,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextHeader(
                subTitle: "Car details",
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Vehicle details and documentation, only your first name and car details are visible to clients during the booking.",
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              mytextField(
                controller: referralCodeController,
                label: "Referral code",
              ),
              const SizedBox(
                height: 20,
              ),
              DroptextField(
                selected: "Vehicle manufacturer*",
                listTextFied: const [
                  "Vehicle manufacturer*",
                  "Toyota",
                  "Camery",
                  "Honda",
                  "Toyotas",
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              DroptextField(
                selected: "Vehicle model*",
                listTextFied: const [
                  "Vehicle model*",
                  "Big dady",
                  "wonders",
                  "LoHoos",
                  "Toyota Bandas",
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              DroptextField(
                selected: "Vehicle year*",
                listTextFied: const [
                  "Vehicle year*",
                  "2023",
                  "2022",
                  "2021",
                  "2020",
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              mytextField(
                  controller: plateNumbercontroller,
                  label: "License plate number*"),
              const SizedBox(
                height: 20,
              ),
              DroptextField(selected: "Vehicle color*", listTextFied: const [
                "Vehicle color*",
                "Red",
                "Green",
                "Blue",
                "Black",
              ]),
              const SizedBox(
                height: 20,
              ),
              AppButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LicensingReg(),
                      ));
                },
                label: "Next",
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}