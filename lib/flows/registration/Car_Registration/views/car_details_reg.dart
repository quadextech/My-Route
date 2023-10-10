import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:myroute/flows/registration/Reg_global_File/drop_textfield.dart';
import 'package:myroute/flows/registration/Reg_global_File/globalFile.dart';
import 'package:myroute/services/verify_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  final vehicleModelController = TextEditingController();
  String? vehicleYear;
  String? vehicleColor;
  bool plateNumberError = false;
  bool referralCode = false;
  bool isLoading = false;
  bool carManuError = false;
  bool carModelError = false;
  bool carYearError = false;
  bool carColorError = false;
  late String? userId;
  @override
  void initState() {
    getId();
    super.initState();
  }

  getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('id');
  }

  List<dynamic> manufacturers = [
    'Audi',
    'Bentley',
    'BMW',
    'Chrysler',
    'Dodge',
    'Ferrari',
    'Fiat',
    'Ford',
    'Genesis',
    'GMC',
    'Honda',
    'Hyundai',
    'Infiniti',
    'Jaguar',
    'Jeep',
    'Kia',
    'Lamborghini',
    'Land Rover',
    'Lexus',
    'Lotus',
    'Maserati',
    'Mazda',
    'Mercedes-Benz',
    'Mini',
    'Mitsubishi',
    'Nissan',
    'Subaru',
    'Tesla',
    'Toyota',
    'Volkswagen',
    'Volvo',
  ];

  List<dynamic> model = [
    'CE',
    'IE',
    'WE',
  ];

  List<dynamic> year = [
    '2013',
    '2014',
    '2015',
    '2016',
    '2017',
    '2018',
    '2019',
    '2020',
    '2021',
    '2022',
    '2023'
  ];

  List<dynamic> color = [
    'White',
    'Black',
    'Silver',
    'Gray',
    'Red',
    'Blue',
    'Green',
    'Yellow',
    'Orange',
    'Beige',
    'Brown',
    'Gold'
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
              mytextField(
                error: '',
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
                onChanged: (value) {
                  setState(() {
                    vehicleManufac = value;
                  });
                },
                listTextFied: manufacturers,
              ),
              const SizedBox(
                height: 20,
              ),
              mytextField(
                error: 'Enter a valid vehicle model',
                controller: vehicleModelController,
                label: "Vehicle model* (e.g. Toyota camry)",
                errorCondition: plateNumberError,
              ),
              const SizedBox(
                height: 20,
              ),
              DroptextField(
                error: 'Select vehicle year',
                errorCondition: carYearError,
                hintText: "Vehicle year*",
                selected: vehicleYear,
                onChanged: (value) {
                  vehicleYear = value;
                },
                listTextFied: year,
              ),
              const SizedBox(
                height: 20,
              ),
              mytextField(
                error: 'Enter a valid plate number',
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
                  onChanged: (value) {
                    vehicleColor = value;
                  },
                  listTextFied: color),
              const SizedBox(
                height: 20,
              ),
              AppButton(
                  textColor: white,
                  label: "Next",
                  onPressed: () async {
                    if (connectivityState.status ==
                        ConnectivityStatus.disconnected) {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            'No internet connection',
                            textAlign: TextAlign.center,
                          ),
                        ));
                      });
                    } else {
                      setState(() {
                        isLoading = true;
                      });
                      if (referralCodeController.text.isEmpty) {
                        setState(() {
                          referralCodeController.text = '';
                        });
                      }
                      if (vehicleManufac == null) {
                        setState(() {
                          isLoading = false;
                          carManuError = true;
                        });
                      }
                      if (vehicleColor == null) {
                        setState(() {
                          isLoading = false;
                          carColorError = true;
                        });
                      }
                      if (vehicleModelController.text.isEmpty) {
                        setState(() {
                          isLoading = false;
                          carModelError = true;
                        });
                      }
                      if (vehicleYear == null) {
                        setState(() {
                          isLoading = false;
                          carYearError = true;
                        });
                      }
                      if (plateNumbercontroller.text.isEmpty) {
                        setState(() {
                          isLoading = false;
                          plateNumberError = true;
                        });
                      }

                      if (isLoading == true) {
                        String message = await carDetailsRef.verifyCarDetails(
                            referralCodeController.text,
                            vehicleManufac,
                            vehicleModelController.text,
                            vehicleYear,
                            plateNumbercontroller.text,
                            vehicleColor,
                            userId);
                        if (message == "Registration Successful") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LicensingReg(
                                  refCode: referralCodeController.text,
                                  vehicleManuf: vehicleManufac!,
                                  vehicleModel: vehicleModelController.text,
                                  year: vehicleYear!,
                                  plateNumber: plateNumbercontroller.text,
                                  color: vehicleColor!,
                                  userId: userId,
                                ),
                              ));
                        }
                      }
                    }
                  }),
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
