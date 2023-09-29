import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mime/mime.dart';
import 'package:myroute/flows/registration/Verification/views/verification_screen.dart';
import 'package:myroute/flows/registration/Forotten_password/views/forgotten_password.dart';
import 'package:myroute/flows/registration/Reg_global_File/globalFile.dart';
import 'package:myroute/flows/registration/login/views/login_sreen.dart';
import 'package:myroute/services/user_authentication.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_image.dart';
import '../../../../constants/textstyle.dart';
import '../../../../services/connectivity_provider.dart';
import '../../Add_ProficPic/views/add_profile_pic.dart';
import '../../Car_Registration/widget/upload_Button.dart';

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
  var sex = "Male";
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode phoneNumberFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  bool phoneError = false;
  bool emailError = false;
  bool nameError = false;
  //bool ninError = false;
  bool passwordMismatch = false;
  bool isLoading = false;
  //bool isPicked = false;



  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
  }

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
    final connectivityState = ref.watch(connectivityProvider);
    final signUpref = ref.watch(userAuthProvider);
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
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
                      error: 'Enter a valid name',
                      errorCondition: nameError,
                      controller: firstNameController,
                      label: "First Name"),
                  const SizedBox(
                    height: 20,
                  ),
                  mytextField(
                      error: 'Enter a valid name',
                      errorCondition: nameError,
                      controller: lastNameController,
                      label: "Last Name"),
                  const SizedBox(
                    height: 20,
                  ),
                  mytextField(
                    errorCondition: emailError,
                    focusNode: emailFocusNode,
                    controller: emailController,
                    label: "E-mail",
                    error: 'Enter a valid email address',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  mytextField(
                    errorCondition: phoneError,
                    keyboardType: TextInputType.phone,
                    controller: phoneNumberController,
                    label: "Phone Number",
                    focusNode: phoneNumberFocusNode,
                    error: 'Enter a valid phone number',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  selectGender(),
                  mytextField(
                    error: '',
                    errorCondition: passwordMismatch,
                    isobsure: true,
                    label: "Password",
                    controller: passwordCcontroller,
                    ispassword: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  mytextField(
                    error: 'Passowrds do not match',
                    errorCondition: passwordMismatch,
                    isobsure: true,
                    label: "Password",
                    controller: passwordCcontroller2,
                    ispassword: true,
                    focusNode: passwordFocusNode,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text("NIN Document",
                  //         style: body3(black, TextDecoration.none)),
                  //     Text("Required*",
                  //         style: body4(errorColor, TextDecoration.none)),
                  //   ],
                  // // ),
                  // const SizedBox(
                  //   height: 8,
                  // ),
                  // Text(
                  //     "Please provide a clear NIN document showing the NIN, your name and date of birth.",
                  //     style: body4(black, TextDecoration.none)),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // Row(
                  //   children: [
                  //     UpLoadButton(onPressed: () async {
                  //       var pickedNinDocPath = await pickFile();
                  //       setState(() {
                  //         ninDocPath = pickedNinDocPath;
                  //         ninError = false;
                  //       });
                  //     }),
                     //   UpLoadButton(onPressed: () async {
                     //     setState(() async {
                     //       ninDocPath = await pickFile();
                     //     });
                     //
                     // // }),
                     //  const SizedBox(width: 5),
                     //  Text(
                     //    ninError ? 'Upload your NIN' : ninDoc,
                     //    overflow: TextOverflow.ellipsis,
                     //    style: TextStyle(
                     //        fontFamily: "Avenir",
                     //        fontSize: 9,
                     //        color: ninError ? errorColor : black),
                     //  ),

                  // const SizedBox(
                  //   height: 20,
                  // ),
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
                      ? Center(
                          child: LoadingAnimationWidget.inkDrop(
                              color: primaryColor, size: 25))
                      : AppButton(
                          textColor: white,
                          label: "Sign Up",
                          onPressed: () async {
                            if (connectivityState.status ==
                                ConnectivityStatus.disconnected) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'No internet connection',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              });
                            } else {
                              setState(() {
                                isLoading = true;
                              });
                              if (lastNameController.text.isEmpty) {
                                setState(() {
                                  nameError = true;
                                  isLoading = false;
                                });
                              }

                              if (passwordCcontroller.text !=
                                      passwordCcontroller2.text ||
                                  passwordCcontroller.text.isEmpty ||
                                  passwordCcontroller2.text.isEmpty) {
                                setState(() {
                                  passwordMismatch = true;
                                  isLoading = false;
                                });
                              }

                              if (!isValidEmail(emailController.text)) {
                                setState(() {
                                  emailError = true;
                                  isLoading = false;
                                });
                              }

                              if (phoneNumberController.text.length != 11) {
                                setState(() {
                                  phoneError = true;
                                  isLoading = false;
                                });
                              }
                              // if (ninDoc == '') {
                              //   setState(() {
                              //     ninError = true;
                              //     isLoading = false;
                              //   });
                              // }
                              if (isLoading == true) {
                                String message = await signUpref.userSignUp(
                                    emailController.text,
                                    passwordCcontroller.text,
                                    firstNameController.text,
                                    lastNameController.text,
                                    phoneNumberController.text,
                                    sex);
                                if (message == 'Sign Up Successful') {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor: black,
                                      content: const Text('Sign Up Successful',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 16)),
                                    ));
                                  });
                                  //
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) => AddProfilePic(email: emailController.text),
                                  //     ));

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            VerificationScreen(
                                                email: emailController.text),
                                      ));
                                  setState(() {
                                    isLoading = false;
                                  });
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text(message,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontSize: 16))));

                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              }
                            }
                          },
                        ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
      height: 80,
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
              Row(
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
              Row(
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
              Row(
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
            ],
          )
        ],
      ),
    );
  }
  //
  // Future pickFile() async {
  //   PermissionStatus status = await Permission.storage.status;
  //   if (status.isRestricted || status.isPermanentlyDenied) {
  //     status = await Permission.storage.request();
  //   }
  //   if (status.isDenied) {
  //     await Permission.storage.request();
  //   }
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();
  //
  //   if (result != null) {
  //     PlatformFile platformFile = result.files.first;
  //
  //
  //     File file = File(platformFile.path!);
  //
  //     List<int> fileBytes = await file.readAsBytes();
  //     String ninDocBase64 = base64Encode(fileBytes);
  //     String ninDocBase = ninDocBase64.replaceAll('/', '');
  //     final String? mimeType = lookupMimeType('', headerBytes: fileBytes);
  //
  //     final String dataUri = "data:$mimeType;base64,$ninDocBase";
  //
  //     setState(() {
  //       ninDoc = platformFile.name;
  //     });
  //     print(dataUri);
  //     return dataUri;
  //   } else {
  //     String message = 'File picking canceled';
  //     return message;
  //   }
  // }
}