import 'package:flutter/material.dart';
import 'package:myroute/constants/constant.dart';
import 'package:myroute/features/registration/Car_Registration/views/car_details_reg.dart';
import 'package:myroute/features/registration/Do_you_have_car/widget/list_Text.dart';
import 'package:myroute/features/registration/Reg_global_File/globalFile.dart';

class DoYouHaveACar extends StatelessWidget {
  const DoYouHaveACar({super.key});

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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Do you own a Car?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
                "Offer rides and make money with your car in these steps."),
            const SizedBox(
              height: 10,
            ),
            Image.asset(AppImage.doYouHaveCar),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Register your car in 3 steps:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListText(
              number: 1,
              label: "Verify your Driving License and other car particulars",
            ),
            const SizedBox(
              height: 10,
            ),
            ListText(number: 2, label: "Add basic Car details"),
            const SizedBox(
              height: 10,
            ),
            ListText(
              number: 3,
              label: "Add Banks details for your payouts",
            ),
            const SizedBox(
              height: 20,
            ),
            AppButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CarDetailsReg(),
                      ));
                },
                label: "Proceed to Car registration"),
            const SizedBox(
              height: 15,
            ),
            AppButton(
              onPressed: () {},
              label: "Skip",
              buttonColor: AppColor.whiteColor,
              textColor: AppColor.blackColor,
            ),
          ],
        ),
      ),
    );
  }
}
