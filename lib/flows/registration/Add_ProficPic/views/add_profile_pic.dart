import 'package:flutter/material.dart';
import 'package:myroute/constants/constant.dart';
import 'package:myroute/flows/registration/AddPayment/views/addPayment.dart';
import 'package:myroute/flows/registration/Reg_global_File/globalfile.dart';

class AddProfilePic extends StatelessWidget {
  const AddProfilePic({super.key});

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
                  backgroundColor: grey,
                  radius: 80,
                  child: Image.asset(userIcon),
                ),
                Positioned(
                  bottom: 9,
                  right: 15,
                  child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: primaryColor,
                        ),
                        shape: BoxShape.circle,
                        color: white,
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
