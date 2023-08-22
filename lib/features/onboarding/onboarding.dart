import 'package:flutter/material.dart';
import '../../constants/app_color.dart';
import '../../constants/app_image.dart';
import '../../flows/registration/Reg_global_File/App_button.dart';
import '../../flows/registration/SignUp/views/Sign_up.dart';
import '../../flows/registration/login/views/login_sreen.dart';

class OnBoarddinngScreeen extends StatefulWidget {
  const OnBoarddinngScreeen({super.key});

  @override
  State<OnBoarddinngScreeen> createState() => _OnBoarddinngScreeenState();
}

class _OnBoarddinngScreeenState extends State<OnBoarddinngScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(onboardingImage),
          ),
          Image.asset(
            swipeIcon,
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
                    color: primaryColor,
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
            buttonColor: Colors.white,
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
    );
  }
}