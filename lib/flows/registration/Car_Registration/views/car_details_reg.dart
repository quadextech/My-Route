import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:myroute/flows/registration/Reg_global_File/drop_textfield.dart';
import 'package:myroute/flows/registration/Reg_global_File/globalFile.dart';
import 'package:myroute/services/verify_card.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_image.dart';
import '../../../../services/cars_service.dart';
import '../../../../services/connectivity_provider.dart';
import '../widget/text_header.dart';
import 'Licensing_details.dart';

class CarDetailsReg extends ConsumerStatefulWidget {
  CarDetailsReg({super.key});

  @override
  ConsumerState<CarDetailsReg> createState() => _CarDetailsRegState();
}

class _CarDetailsRegState extends ConsumerState<CarDetailsReg> {
  TextEditingController referralCodeController = TextEditingController();

  TextEditingController plateNumbercontroller = TextEditingController();
  String? vehicleManufac;
  String? vehicleModel;
  String? vehicleYear;
  String? vehicleColor;
  bool plateNumberError = false;
  bool referralCode = false;
  bool isLoading = false;
  bool carManuError = false;
  bool carModelError = false;
  bool carYearError = false;
  bool carColorError = false;

  List<dynamic> manufacturers = [
    'Toyota',
    'Honda',
    'Ford',
  ];

  List<dynamic> model = [
    'CE',
    'IE',
    'WE',
  ];

  List<dynamic> year =[
    '2020',
    '2021',
    '2022',
  ];

  List<dynamic> color = [
    'Red',
    'Black',
  ];


  @override
  Widget build(BuildContext context) {
     final carDetailsRef = ref.watch(carServiceProvider);
     final connectivityState = ref.watch(connectivityProvider);
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextHeader(
                subTitle: "Car details",
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Vehicle details and documentation, only your first name and car details are visible to clients during the booking.",
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              mytextField(error: '',
                controller: referralCodeController,
                label: "Referral code",
                errorCondition: referralCode,
              ),
              const SizedBox(
                height: 20,
              ),
              DroptextField(
                error: "Select vehicle manufacturer",
                errorCondition: carManuError,
                hintText: "Vehicle manufacturer*",
                selected: vehicleManufac,
                onChanged: (value){
                  setState(() {
                    vehicleManufac = value;
                  });
                },
                listTextFied: manufacturers,
              ),
              const SizedBox(
                height: 20,
              ),
              DroptextField(
                error: "Select vehicle model",
                errorCondition: carModelError,
                hintText: "Vehicle model*",
                selected: vehicleModel,
                onChanged: (value){
                  vehicleModel= value;
                },
                listTextFied: model,
              ),
              const SizedBox(
                height: 20,
              ),
              DroptextField(
                error: 'Select vehicle year',
                errorCondition: carYearError,
                hintText: "Vehicle year*",
                selected: vehicleYear,
                onChanged: (value){
                  vehicleYear = value;
                },
                listTextFied: year,
              ),
              const SizedBox(
                height: 20,
              ),
              mytextField(error: 'Enter a valid plate number',
                  controller: plateNumbercontroller,
                  label: "License plate number*",
                errorCondition: plateNumberError,
              ),
              const SizedBox(
                height: 20,
              ),
              DroptextField(
                error: "Select vehicle color",
                errorCondition: carColorError,
                hintText: "Vehicle color*",
                  selected: vehicleColor,
                  onChanged: (value){
                  vehicleColor = value;
                  },
                  listTextFied: color),
              const SizedBox(
                height: 20,
              ),

              isLoading ? Center(child: LoadingAnimationWidget.inkDrop(color: primaryColor, size: 25)) :
              AppButton(
                label: "Next",
                onPressed: () async{
                  if (connectivityState.status == ConnectivityStatus.disconnected){
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:  Text(
                              'No internet connection',
                              textAlign: TextAlign.center,
                            ),)
                      );
                    });
                  } else {
                    setState(() {
                      isLoading = true;
                    });
                    if (vehicleManufac == null){
                      setState(() {
                        isLoading = false;
                        carManuError = true;
                      });
                    }
                    if (vehicleColor == null){
                      setState(() {
                        isLoading = false;
                        carColorError = true;
                      });
                    }
                    if (vehicleModel == null){
                      setState(() {
                        isLoading = false;
                        carModelError = true;
                      });
                    }
                    if (vehicleYear == null){
                      setState(() {
                        isLoading = false;
                        carYearError = true;
                      });
                    }
                    if (plateNumbercontroller.text.isEmpty){
                      setState(() {
                        isLoading = false;
                        plateNumberError = true;
                      });
                    }

                    if(isLoading == true){
                    String message = await carDetailsRef.verifyCarDetails(vehicleManufac, vehicleModel, vehicleYear, vehicleColor, plateNumbercontroller.text, referralCodeController.text);
                      if (message == "Registration Successful"){
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const LicensePage(),
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
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}