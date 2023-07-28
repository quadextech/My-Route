import 'package:flutter/material.dart';
import 'package:myroute/constants/constant.dart';
import 'package:myroute/flows/registration/SignUp/views/sign_up.dart';
import 'package:myroute/flows/registration/login/views/login_sreen.dart';
import 'package:myroute/flows/registration/Reg_global_File/App_button.dart';

import '../../constants/app_color.dart';
import '../../constants/app_image.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List images = [
    onboardingImage,
    onboarding2Image,
    onboarding3Image,
    onboarding4Image,
    onboarding5Image
  ];

  List texts = [
    "Share a ride with ",
    "Earn money driving with ",
    "Maintain your car with ",
    "Save your funds with ",
    "Get rewarded with "
  ];

  List subTexts = [
    "Effortlessly Connect with Others and Make Your Commute a Breeze.",
    "Join Our Community of Earn-While-You-Drive Carpooles and Maximize Your Commute.",
    "We relieve you the stress of keeping up with car document maintenace and driving license",
    'Keep some money aside for your car maintenance either from income made driving or a deposit.',
    'Enjoy benefits from carpooling with us and saving the economy.'
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.10),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: size.height * 0.4),
              child: Stack(children: [
                PageView.builder(
                    itemCount: images.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(
                        images[index],
                        fit: BoxFit.contain,
                      );
                    }),
              ]),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(images.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: SliderContainer(
                        color: _currentIndex == index
                            ? primaryColor
                            : grey),
                  );
                })),

            const SizedBox(height: 10),
            SizedBox(height: 20, child: Image.asset(swipeIcon)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                    children: List.generate(texts.length, (index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: RichText(
                          text: TextSpan(
                              text: _currentIndex == index ? texts[index] : '',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: black,
                                  fontWeight: FontWeight.bold),
                              children: [
                            TextSpan(
                                text: _currentIndex == index ? "My Route" : "",
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                ))
                          ])));
                })),
              ],
            ),const SizedBox(
              height: 20,
            ),
            Stack(//mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(subTexts.length, (index) {
              return SizedBox(width: double.infinity,
                child: Text(
                  _currentIndex == index ? subTexts[index] : '',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.fade,
                  style: TextStyle(color:black),
                ),
              );
            })),
            const SizedBox(
              height: 20,
            ),
           
            AppButton(
              label: "Sign Up",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ));
              },
            ),
            const SizedBox(
              height: 15,
            ),
            AppButton(
              label: "Log In",
              buttonColor: white,
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

class SliderContainer extends StatelessWidget {
  const SliderContainer({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 15,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(5), color: color),
    );
  }
}