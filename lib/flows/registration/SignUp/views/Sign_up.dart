import 'package:flutter/material.dart';
import 'package:myroute/constants/constant.dart';
import 'package:myroute/flows/registration/Verification/views/verification_screen.dart';
import 'package:myroute/flows/registration/Forotten_password/views/forgotten_password.dart';
import 'package:myroute/flows/registration/Reg_global_File/globalFile.dart';
import 'package:myroute/flows/registration/login/views/login_sreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordCcontroller = TextEditingController();
  TextEditingController passwordCcontroller2 = TextEditingController();

  bool isPicked = false;

  var sex = "Male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: primaryColor,
                    image: DecorationImage(
                      image: AssetImage(
                        backgroungImage,
                      ),
                    )),
                child: Center(
                  child: Image.asset(
                    appLogo,
                    width: 100,
                    height: 100,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Welcome to MyRoute",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text('Sign up to get started'),
                  const SizedBox(
                    height: 15,
                  ),
                  mytextField(
                      controller: firstNameController, label: "First Name*"),
                  const SizedBox(
                    height: 20,
                  ),
                  mytextField(
                      controller: lastNameController, label: "Last Name*"),
                  const SizedBox(
                    height: 20,
                  ),
                  mytextField(controller: emailController, label: "E-mail*"),
                  const SizedBox(
                    height: 15,
                  ),
                  mytextField(
                      keyboardType: TextInputType.phone,
                      controller: emailController,
                      label: "Phone Number*"),
                  const SizedBox(
                    height: 20,
                  ),
                  selectGender(),
                  mytextField(
                    isobsure: true,
                    label: "Password*",
                    controller: passwordCcontroller,
                    ispassword: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  mytextField(
                    isobsure: true,
                    label: "Password*",
                    controller: passwordCcontroller2,
                    ispassword: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgetPassword(),
                          ));
                    },
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "By signing up, you accept our T&Cs and Privacy Policy. ",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      "This information is collected by MyRoute for the purpose of creating your account, managing your bookings, use and improve our services and ensuring the security of our platform. ",
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AppButton(
                    label: "Sign Up",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VerificationScreen(),
                          ));
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Divider(),
                      Text("Or Sign Up with"),
                      Divider(
                        thickness: 10,
                        height: 10,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(
                        image: Image.asset(facebookIcon),
                        onPressed: () {},
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SocialButton(
                        image: Image.asset(googleIcon),
                        onPressed: () {},
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SocialButton(
                        image: Image.asset(appleIcon),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Already have an account?"),
                        Text(
                          " Log In",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox selectGender() {
    return SizedBox(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Select Gender*",
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 100,
                child: Row(
                  children: [
                    const Text("Male"),
                    Radio(
                        focusColor: primaryColor,
                        activeColor: primaryColor,
                        value: "Male",
                        groupValue: sex,
                        onChanged: (String? v) {
                          if (v != null) {
                            setState(() {
                              sex = v;
                            });
                          }
                        }),
                  ],
                ),
              ),
              SizedBox(
                width: 100,
                child: Row(
                  children: [
                    const Text("Female"),
                    Radio(
                        activeColor: primaryColor,
                        value: "Female",
                        groupValue: sex,
                        onChanged: (String? v) {
                          if (v != null) {
                            setState(() {
                              sex = v;
                            });
                          }
                        }),
                  ],
                ),
              ),
              SizedBox(
                width: 120,
                child: Row(
                  children: [
                    const Text("Non-binary"),
                    Radio(
                        activeColor: primaryColor,
                        value: "Non-binary",
                        groupValue: sex,
                        onChanged: (String? v) {
                          if (v != null) {
                            setState(() {
                              sex = v;
                            });
                          }
                        }),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
