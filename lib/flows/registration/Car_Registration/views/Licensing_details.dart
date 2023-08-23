import 'package:flutter/material.dart';
import 'package:myroute/constants/constant.dart';
import 'package:myroute/flows/registration/Car_Registration/views/upload_reg.dart';
import 'package:myroute/flows/registration/Reg_global_File/globalFile.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../constants/app_image.dart';
import '../widget/text_header.dart';

class LicensingReg extends StatefulWidget {
  final String refCode;
  final String vehicleManuf;
  final String vehicleModel;
  final String year;
  final String plateNumber;
  final String color;
  final userId;
  const LicensingReg(
      {super.key,
      required this.refCode,
      required this.vehicleManuf,
      required this.vehicleModel,
      required this.year,
      required this.plateNumber,
      required this.color,
      required this.userId});

  @override
  State<LicensingReg> createState() => _LicensingRegState();
}

class _LicensingRegState extends State<LicensingReg> {
  TextEditingController driverLicenseController = TextEditingController();
  bool licenseError = false;

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextHeader(
              subTitle: "Licensing details",
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Your national ID and license details will be kept private.",
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
                error: 'Enter a valid number',
                errorCondition: licenseError,
                controller: driverLicenseController,
                label: "Driver license or JTB Form Number*"),
            const SizedBox(
              height: 10,
            ),
            const Text("License number on your Driver’s documents"),
            const SizedBox(
              height: 15,
            ),
            AppButton(
                onPressed: () {
                  if (driverLicenseController.text.isEmpty) {
                    setState(() {
                      licenseError = true;
                    });
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UploadFlieReg(userId: widget.userId,
                              licenseNumber: driverLicenseController.text,
                              refCode: widget.refCode,
                              vehicleManuf: widget.vehicleManuf,
                              vehicleModel: widget.vehicleModel,
                              year: widget.year,
                              plateNumber: widget.plateNumber,
                              color: widget.color),
                        ));
                  }
                },
                label: "Next"),
          ],
        ),
      ),
    );
  }
}
