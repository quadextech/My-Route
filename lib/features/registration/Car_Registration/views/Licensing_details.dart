import 'package:flutter/material.dart';
import 'package:myroute/constants/constant.dart';
import 'package:myroute/features/registration/Car_Registration/views/upload_reg.dart';
import 'package:myroute/features/registration/Reg_global_File/globalFile.dart';

import '../widget/text_header.dart';

class LicensingReg extends StatelessWidget {
  LicensingReg({super.key});

  TextEditingController driverLicenseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
        elevation: 0,
        backgroundColor: AppColor.whiteColor,
        centerTitle: true,
        title: Image.asset(
          AppImage.appLogo2,
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UploadFlieReg(),
                      ));
                },
                label: "Next"),
          ],
        ),
      ),
    );
  }
}
