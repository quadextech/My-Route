import 'package:flutter/material.dart';
import 'package:myroute/constants/constant.dart';
import 'package:myroute/features/registration/SignUp/views/Sign_up.dart';
import 'package:myroute/features/registration/login/views/login_sreen.dart';
import 'package:myroute/features/registration/Reg_global_File/AppButton.dart';

class OnBoarddinngScreeen extends StatefulWidget {
  const OnBoarddinngScreeen({super.key});

  @override
  State<OnBoarddinngScreeen> createState() => _OnBoarddinngScreeenState();
}

class _OnBoarddinngScreeenState extends State<OnBoarddinngScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(AppImage.onboardingImage),
            ),
            Image.asset(
              AppImage.swipeIcon,
              height: 30,
              width: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Share a ride with ",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Text("MyRoute",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor,
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Effortlessly Connect with Others and Make Your Commute a Breeze.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            AppButton(
              label: "Sign In",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            AppButton(
              label: "Login",
              buttonColor: AppColor.whiteColor,
              textColor: Colors.black,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
