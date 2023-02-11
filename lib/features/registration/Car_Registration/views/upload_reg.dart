import 'package:flutter/material.dart';
import 'package:myroute/constants/constant.dart';
import 'package:myroute/features/registration/Car_Registration/views/payment_detail.dart';
import 'package:myroute/features/registration/Reg_global_File/globalFile.dart';

import '../widget/text_header.dart';
import '../widget/upload_Button.dart';

class UploadFlieReg extends StatelessWidget {
  UploadFlieReg({super.key});

  TextEditingController expiryDateController = TextEditingController();

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextHeader(
                subTitle: "Upload documents",
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "We are legally required to ask you for some documents to register your car. Document scans and quality photos are accepted.",
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Driver’s License",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Required*",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Text(
                "Please provide a clear driver’s license showing the license number, your name and date of birth.",
              ),
              const SizedBox(
                height: 20,
              ),
              const UpLoadButton(),
              const SizedBox(
                height: 20,
              ),
              mytextField(
                  controller: expiryDateController,
                  label: "Driver’s License expiry date*"),
              const Text("License number on your Driver’s documents"),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Exterior Photo of your Cars",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Required*",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Upload a clear exterior photo that captures the plate number.",
              ),
              const SizedBox(
                height: 20,
              ),
              const UpLoadButton(),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Interior Photo of your Car",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Required*",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Upload a clear interior photo of your car.",
              ),
              const SizedBox(
                height: 20,
              ),
              const UpLoadButton(),
              const SizedBox(
                height: 30,
              ),
              AppButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentDetail(),
                        ));
                  },
                  label: "Next"),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
