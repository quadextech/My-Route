import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myroute/flows/PassengerBookingFlow/global_file/global_file.dart';
import 'package:myroute/flows/PassengerBookingFlow/global_file/global_form_feild.dart';
import 'package:myroute/flows/registration/Reg_global_File/App_button.dart';
import 'package:myroute/flows/registration/Reg_global_File/custom_text_field.dart';

import '../../../constants/app_color.dart';
import '../../../constants/app_image.dart';
import '../../../constants/textstyle.dart';
import '../../PassengerBookingFlow/view/SearchingAvailableRide/SearchavailableRide_method.dart';
import '../../registration/Reg_global_File/back_button.dart';

class AddBankAccount extends StatefulWidget {
  const AddBankAccount({super.key});

  @override
  State<AddBankAccount> createState() => _AddBankAccountState();
}

class _AddBankAccountState extends State<AddBankAccount> {
  TextEditingController acctNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final passwordError = false;
  @override
  void dispose() {
    acctNoController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        leading: AppBackButton(),
        centerTitle: true,
        title: Text(
          'Add Bank Account',
          style: body1(black, TextDecoration.none),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'We pay your withdrawals into your bank account. Please enter your account number.',
              style: body4(grey5, TextDecoration.none),
            ),
            SizedBox(height: 20),
            Text(
              'Account Number',
              style: body3(black, TextDecoration.none),
            ),
            SizedBox(height: 10),
            GlobaltextField(
                controller: acctNoController,
                preficIcon: Text(''),
                label: '1111111111'),
            SizedBox(height: 20),
            Text(
              'Choose your Bank',
              style: body3(black, TextDecoration.none),
            ),
            SizedBox(height: 10),
            GlobalDroptextField(),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.person, color: greenColor),
                Text('Boluwatife Jennifer Micheal'),
              ],
            ),
            SizedBox(height: 20),
            AppButton(
                onPressed: () {Navigator.pop(context);
                  enterPassword(context);
                },
                label: 'Continue',
                textColor: white)
          ],
        ),
      ),
    );
  }

  void enterPassword(context) {
    final size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: CustomPopUpContainer(
                height: size.height * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Pleaase enter your MyRoute Password',
                        style: headline4(black)),
                    const SizedBox(
                      height: 20,
                    ),
                    mytextField(
                      controller: passwordController,
                      label: 'Password*',
                      error: 'Enter a valid password',
                      errorCondition: passwordError,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Having some trouble?',
                          style: body4(black, TextDecoration.none),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Reset your password',
                            style: body4(greenColor, TextDecoration.none),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppButton(
                        onPressed: () 
                        {Navigator.pop(context);
                          message(context);},
                        label: 'Save Bank Details',
                        textColor: white)
                  ],
                )),
          );
        });
  }

  void message(context) {
    final size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        context: context,
        builder: (context) {
          return SingleChildScrollView(
              child: CustomPopUpContainer(
                  child: Column(
            children: [
              const SizedBox(height: 20),
              SvgPicture.asset(success, color: successColor),
              const SizedBox(
                height: 20,
              ),
              Text('Success!', style: headline2(successColor)),
              const SizedBox(
                height: 20,
              ),
              const Text('Your new Bank Details have been saved successfully'),
              const SizedBox(
                height: 30,
              ),
              AppButton(
                  textColor: white,
                  onPressed: () {},
                  label: 'Back to Transfer Funds'),
              SizedBox(height: 10),
              AppButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                label: 'Exit',
                textColor: black,
                buttonColor: white,
              )
            ],
          )));
        });
  }
}
