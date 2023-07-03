import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myroute/constants/constant.dart';
import 'package:myroute/flows/registration/Add_ProficPic/views/add_profile_pic.dart';
import 'package:myroute/flows/registration/Reg_global_File/globalFile.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_image.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  String? code;

  String accessCode = "1255";

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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Verify your new account ",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Enter the 6-digit code sent to you at 09065745693"),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: grey,
                    ),
                    width: 50,
                    child: Center(
                        child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          String nevalue = ("$code$value");

                          code = nevalue;
                        });
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: grey,
                    ),
                    width: 50,
                    child: Center(
                        child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          String nevalue = ("$code$value");

                          code = nevalue;
                        });
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        } else {
                          if (value.isEmpty) {
                            FocusScope.of(context).previousFocus();
                          }
                        }
                      },
                      onSaved: (newValue3) {},
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: grey,
                    ),
                    width: 50,
                    child: Center(
                        child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          String nevalue = ("$code$value");

                          code = nevalue;
                        });
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        } else {
                          if (value.isEmpty) {
                            FocusScope.of(context).previousFocus();
                          }
                        }
                      },
                      onSaved: (newValue3) {},
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: grey,
                    ),
                    width: 50,
                    child: Center(
                        child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          String nevalue = ("$code$value");

                          code = nevalue;
                        });
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        } else {
                          if (value.isEmpty) {
                            FocusScope.of(context).previousFocus();
                          }
                        }
                      },
                      onSaved: (newValue3) {},
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: grey,
                    ),
                    width: 50,
                    child: Center(
                        child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          String nevalue = ("$code$value");

                          code = nevalue;
                        });
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        } else {
                          if (value.isEmpty) {
                            FocusScope.of(context).previousFocus();
                          }
                        }
                      },
                      onSaved: (newValue3) {},
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: grey,
                    ),
                    width: 50,
                    child: Center(
                        child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          String nevalue = ("$code$value");

                          code = nevalue;
                        });
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        } else {
                          if (value.isEmpty) {
                            FocusScope.of(context).previousFocus();
                          }
                        }
                      },
                      onSaved: (newValue3) {},
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    )),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              AppButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddProfilePic(),
                      ));
                },
                label: "Confirm",
              ),
              const SizedBox(
                height: 30,
              ),
              const Center(child: Text("Resend SMS code (59 secs)"))
            ]),
      ),
    );
  }
}