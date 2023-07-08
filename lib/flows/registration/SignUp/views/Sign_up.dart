import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:myroute/flows/registration/Verification/views/verification_screen.dart';
import 'package:myroute/flows/registration/Forotten_password/views/forgotten_password.dart';
import 'package:myroute/flows/registration/Reg_global_File/globalFile.dart';
import 'package:myroute/flows/registration/login/views/login_sreen.dart';
import 'package:myroute/services/user_authentication.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_image.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordCcontroller = TextEditingController();
  TextEditingController passwordCcontroller2 = TextEditingController();
  bool isLoading = false;
  bool isPicked = false;

  var sex = "Male";
  @override
  void dispose() {
    firstNameController.dispose();
    phoneNumberController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordCcontroller.dispose();
    passwordCcontroller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signUpref = ref.watch(userAuthProvider);
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
                      controller: phoneNumberController,
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
                  isLoading
                      ?  Center(child: LoadingAnimationWidget.inkDrop(color: primaryColor, size: 25))
                      : AppButton(
                          label: "Sign Up",
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });
                           
                          String message =  await signUpref.userSignUp(
                                emailController.text,
                                passwordCcontroller.text,
                                firstNameController.text,
                                lastNameController.text,
                                phoneNumberController.text,
                                sex
                                );
                                if (message == 'Sign Up Successful'){
                                  
                                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: black,
                          content: Text('Sign Up Successful',
                          
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 16)),
                             ));
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const VerificationScreen(),
                                ));
                                 setState(() {
                              isLoading = false;
                            });
                                }else{
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                          content: Text(message,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 16))));
                    

                      setState(() {
                        isLoading = false;
                      });
                    
                                }
                                
                           
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
