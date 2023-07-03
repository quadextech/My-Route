import 'package:flutter/material.dart';
import 'package:myroute/constants/constant.dart';
import 'package:myroute/flows/registration/Do_you_have_car/views/do_you_have_a_car.dart';
import 'package:myroute/flows/registration/Reg_global_File/globalfile.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_image.dart';

class AppPayment extends StatefulWidget {
  const AppPayment({super.key});

  @override
  State<AppPayment> createState() => _AppPaymentState();
}

class _AppPaymentState extends State<AppPayment> {
  TextEditingController cardNumberController = TextEditingController();

  TextEditingController expiryDateController = TextEditingController();

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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Add your card details",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Save a debit card on your MyRoute account for transactions.",
              ),
              const SizedBox(
                height: 20,
              ),
              mytextField(
                label: "cw",
                keyboardType: TextInputType.text,
                controller: cardNumberController,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Expanded(
                    child: mytextField(
                        controller: expiryDateController, label: "Expiry date"),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  
                  Expanded(
                    child: mytextField(
                        controller: expiryDateController, label: "Secure code"),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              AppButton(onPressed: () {}, label: "Add card"),

              const SizedBox(
                height: 20,
              ),
              AppButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DoYouHaveACar(),
                      ));
                },
                label: "Skip",
                buttonColor: white,
                textColor: black,
              )
            ],
          ),
        ),
      ),
    );
  }
}