import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:myroute/constants/constant.dart';
import 'package:myroute/constants/textstyle.dart';
import 'package:myroute/flows/registration/Reg_global_File/globalfile.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_image.dart';
import '../../../../services/banks_services.dart';
import '../../../../services/connectivity_provider.dart';
import '../../../../services/drivers_services.dart';
import '../../../PassengerBookingFlow/view/BookRideHomePage/model/HomePage.dart';
import '../../../PassengerBookingFlow/view/SearchingAvailableRide/SearchavailableRide_method.dart';
import '../../Do_you_have_car/views/do_you_have_a_car.dart';
import '../widget/text_header.dart';

class PaymentDetail extends ConsumerStatefulWidget {
  final String userId;
  final String referralCode;
  final String vehicleColor;
  final String vehicleManufacturer;
  final String vehicleModel;
  final String vehicleyear;
  final String platenumberlicense;
  final String driverlicensenumber;
  final String driverlicense;
  final String driverlicenseexpiryDate;
  final String outSideCarPhoto;
  final String inSideCarPhoto;

  PaymentDetail({
    super.key,
    required this.userId,
    required this.vehicleColor,
    required this.referralCode,
    required this.vehicleManufacturer,
    required this.vehicleModel,
    required this.vehicleyear,
    required this.platenumberlicense,
    required this.driverlicensenumber,
    required this.driverlicense,
    required this.driverlicenseexpiryDate,
    required this.outSideCarPhoto,
    required this.inSideCarPhoto,
  });

  @override
  ConsumerState<PaymentDetail> createState() => _PaymentDetailState();
}

class _PaymentDetailState extends ConsumerState<PaymentDetail> {
  TextEditingController addressController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  bool addressError = false;
  bool accountNameError = false;
  bool accountNumberError = false;
  bool bankNameError = false;
  bool isLoading = false;
  bool ismessage = false;
  @override
  void dispose() {
    addressController.dispose();
    accountNameController.dispose();
    accountNumberController.dispose();
    bankNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final connectivityState = ref.watch(connectivityProvider);
    final driverServiceRef = ref.watch(driverServiceProvider);
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
                error: "Address cannot be null",
                errorCondition: addressError,
                controller: addressController,
                label: "Address*",
              ),
              const SizedBox(
                height: 20,
              ),
              mytextField(
                error: "Account name cannot be null",
                errorCondition: accountNameError,
                controller: accountNameController,
                label: "Bank account holder name*",
              ),
              const SizedBox(
                height: 20,
              ),
              mytextField(
                error: "Account number invalid",
                errorCondition: accountNumberError,
                keyboardType: TextInputType.number,
                controller: accountNumberController,
                label: "Bank account number*",
              ),
              const SizedBox(
                height: 20,
              ),
              mytextField(
                error: "Bank name can't be null",
                errorCondition: bankNameError,
                controller: bankNameController,
                label: "Bank name*",
              ),
              const SizedBox(
                height: 20,
              ),
              isLoading
                  ? Center(
                      child: LoadingAnimationWidget.inkDrop(
                          color: primaryColor, size: 25))
                  : AppButton(
                      label: "Finish",
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
                          if (addressController.text.isEmpty) {
                            setState(() {
                              isLoading = false;
                              addressError = true;
                            });
                          }
                          if (accountNameController.text.isEmpty) {
                            setState(() {
                              isLoading = false;
                              accountNameError = true;
                            });
                          }
                          if (accountNumberController.text.isEmpty) {
                            setState(() {
                              isLoading = false;
                              accountNumberError = true;
                            });
                          }
                          if (bankNameController.text.isEmpty) {
                            setState(() {
                              isLoading = false;
                              bankNameError = true;
                            });
                          }
                          if (isLoading == true) {
                            String message = await driverServiceRef.uploadFiles(
                                widget.userId,
                                widget.referralCode,
                                widget.vehicleManufacturer,
                                widget.vehicleModel,
                                widget.vehicleyear,
                                widget.platenumberlicense,
                                widget.driverlicensenumber,
                                widget.driverlicense,
                                widget.driverlicenseexpiryDate,
                                widget.outSideCarPhoto,
                                widget.inSideCarPhoto,
                                addressController.text,
                                accountNameController.text,
                                accountNumberController.text,
                                bankNameController.text,
                                widget.vehicleColor);
                            if (message == 'Bank details added Successfully') {
                              setState(() {
                                ismessage = true;
                              });
                            }
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => CustomPopUpContainer(
                                height: 350,
                                child: ismessage
                                    ? Expanded(
                                        child: Container(
                                          child: Column(
                                            children: [
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Image.asset(success, color: successColor,),
                                              Text(
                                                'Success!',
                                                style: body2(successColor,
                                                    TextDecoration.none),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Your car has been registered successfully',
                                                style: body3(
                                                    black, TextDecoration.none),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              AppButton(
                                                  buttonColor: black,
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              const DoYouHaveACar(),
                                                        ));
                                                  },
                                                  label: "Go to Fleet"),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              AppButton(
                                                  textColor: black,
                                                  buttonColor: white,
                                                  onPressed: () {
                                                    // Navigator.push(
                                                    //     context,
                                                    //     MaterialPageRoute(
                                                    //       builder: (context) => BottomNav(),
                                                    //     ));
                                                  },
                                                  label: "Exit registration"),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Column(
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          SvgPicture.asset(svgerror),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Error!',
                                            style: body2(errorColor,
                                                TextDecoration.none),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Sorry, Complete your Car registration before you proceed.',
                                            style: body3(
                                                grey1, TextDecoration.none),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          AppButton(
                                              buttonColor: black,
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const DoYouHaveACar(),
                                                    ));
                                              },
                                              label: "Return to Registration"),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          AppButton(
                                              buttonColor: white,
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const PassengerHome(),
                                                    ));
                                              },
                                              label: "Exit registration"),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                              ),
                              isDismissible: false,
                              isScrollControlled: true,
                            );
                            setState(() {
                              isLoading = false;
                            });

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => BottomNav(),
                            //     ));
                          }
                        }
                      })
            ],
          ),
        ),
      ),
    );
  }
}
