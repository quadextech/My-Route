import 'package:flutter/material.dart';
import 'package:myroute/constants/constant.dart';
import 'package:myroute/flows/registration/Reg_global_File/globalfile.dart';

import '../widget/text_header.dart';

class PaymentDetail extends StatefulWidget {
  PaymentDetail({super.key});

  @override
  State<PaymentDetail> createState() => _PaymentDetailState();
}

class _PaymentDetailState extends State<PaymentDetail> {
  TextEditingController adrressController = TextEditingController();

  TextEditingController accountNameController = TextEditingController();

  TextEditingController accountNumberController = TextEditingController();

  TextEditingController bankNameController = TextEditingController();

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              TextHeader(
                subTitle: "Payment details",
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "We need your payment details to pay you if you’ll be offering rides with your Car or lending it out to a driver.",
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              mytextField(
                controller: adrressController,
                label: "Address*",
              ),
              const SizedBox(
                height: 20,
              ),
              mytextField(
                controller: accountNameController,
                label: "Bank account holder name*",
              ),
              const SizedBox(
                height: 20,
              ),
              mytextField(
                keyboardType: TextInputType.number,
                controller: accountNumberController,
                label: "Bank account number*",
              ),
              const SizedBox(
                height: 20,
              ),
              mytextField(
                controller: bankNameController,
                label: "Bank name*",
              ),
              const SizedBox(
                height: 20,
              ),
              AppButton(onPressed: () {}, label: "Finish"),
            ],
          ),
        ),
      ),
    );
  }
}
