import 'package:flutter/material.dart';
import 'package:myroute/features/registration/Reg_global_File/Custom_Text_Fied.dart';
import 'package:myroute/features/registration/Reg_global_File/AppButton.dart';
import 'package:myroute/features/registration/Reg_global_File/BackButton.dart';
import 'package:myroute/constants/app_image.dart';

import '../../SignUp/views/Sign_up.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(
              height: 30,
            ),


            Container(
              height: 40,
              width: 261,
              child: Row(
                children: [

                  AppBackButton(),
                  SizedBox(
                    width: 75,
                  ),
                  Image.asset(AppImage.appLogo2,
                    height: 25,
                  ),


                ],
              ),
            ),


            const SizedBox(
              height: 20,
            ),

            const Text(
              "Reset Password",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Enter your registered E-mail to receive a rest link"),
            const SizedBox(
              height: 30,
            ),
            mytextField(controller: emailController, label: "E-mail"),
            const SizedBox(
              height: 30,
            ),
            AppButton(
              onPressed: () {},
              label: "Reset",
            ),
            const SizedBox(
              height: 20,
            ),
             Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ));
                },
                child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Or ',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),

                        TextSpan(
                          text: 'create a new account',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline
                          )
                        )
                      ]
                    )),
              ),

            ),
          ],
        ),),
      ),
    );
  }
}