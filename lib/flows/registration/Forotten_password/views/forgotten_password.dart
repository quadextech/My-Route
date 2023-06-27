import 'package:flutter/material.dart';
import 'package:myroute/flows/registration/Reg_global_File/custom_text_field.dart';
import 'package:myroute/flows/registration/Reg_global_File/App_button.dart';
import 'package:myroute/flows/registration/Reg_global_File/back_button.dart';

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
            AppBackButton(),
            const SizedBox(
              height: 10,
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
              height: 20,
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
            const Center(
              child: Text(
                "Or create a new account",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
