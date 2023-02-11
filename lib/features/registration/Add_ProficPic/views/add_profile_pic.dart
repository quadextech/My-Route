import 'package:flutter/material.dart';
import 'package:myroute/constants/constant.dart';
import 'package:myroute/features/registration/AddPayment/views/addPayment.dart';
import 'package:myroute/features/registration/Reg_global_File/globalFile.dart';

class AddProfilePic extends StatelessWidget {
  const AddProfilePic({super.key});

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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Add a profile picture",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Verify your identity, passengers will want to see who you are.",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Make sure it meets the requirements",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Clearly visible face \nNo sunglasses\nGood lighting, no filters.",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
                child: Stack(
              children: [
                CircleAvatar(
                  backgroundColor: AppColor.greyColor,
                  radius: 80,
                  child: Image.asset(AppImage.userIcon),
                ),
                Positioned(
                  bottom: 9,
                  right: 15,
                  child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColor.primaryColor,
                        ),
                        shape: BoxShape.circle,
                        color: AppColor.whiteColor,
                      ),
                      child: const Icon(Icons.edit)),
                )
              ],
            )),
            const SizedBox(
              height: 20,
            ),
            AppButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppPayment(),
                  ),
                );
              },
              label: "Looks good! Proceed",
            )
          ],
        ),
      ),
    );
  }
}
