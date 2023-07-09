import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:myroute/flows/registration/Do_you_have_car/views/do_you_have_a_car.dart';
import 'package:myroute/flows/registration/Reg_global_File/globalfile.dart';
import 'package:myroute/services/verify_card.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_image.dart';

class AppPayment extends ConsumerStatefulWidget {
  const AppPayment({super.key});

  @override
  ConsumerState<AppPayment> createState() => _AppPaymentState();
}

class _AppPaymentState extends ConsumerState<AppPayment> {
  TextEditingController cardNumberController = TextEditingController();

  TextEditingController expiryDateController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    cardNumberController.dispose();
    expiryDateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final verifyCardRef = ref.watch(cardVerificationProvider);
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
                error: '',
                errorCondition: false,
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
                        errorCondition: false,
                        error: '',
                        controller: expiryDateController,
                        label: "Expiry date"),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: mytextField(
                        error: '',
                        errorCondition: false,
                        controller: expiryDateController,
                        label: "Secure code"),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              isLoading
                      ? Center(
                          child: LoadingAnimationWidget.inkDrop(
                              color: primaryColor, size: 25))
                      : AppButton(onPressed: ()
 async {
                  setState(() {
                    isLoading = true;
                  });

                  String message = await verifyCardRef.verifyCardDetails(
                      'cardNumber', 'expirationDate', 'cvv');

if (message == 'verification successful'){
   WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor: black,
                                      content: const Text('Verification successful',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 16)),
                                    ));
                                  });
                                   Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DoYouHaveACar(),
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

                      }, label: "Add card"),
              const SizedBox(
                height: 20,
              ),
              AppButton(
                onPressed: (){},
                 
                
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
