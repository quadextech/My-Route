import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:myroute/constants/textstyle.dart';
import 'package:myroute/flows/PassengerBookingFlow/global_file/global_file.dart';
import 'package:myroute/flows/driver_booking/view/SearchingAvailableRide/SearchavailableRide_method.dart';
import 'package:myroute/services/passengersRide.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../constants/app_color.dart';
import '../../../../../constants/app_image.dart';
import '../../../../../services/driver_ride.dart';
import '../../../../registration/Reg_global_File/App_button.dart';

import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';

import 'BorderButton.dart';

class SelectedCar extends ConsumerStatefulWidget {
  const SelectedCar({super.key});

  @override
  ConsumerState<SelectedCar> createState() => _SelectedCarState();
}

class _SelectedCarState extends ConsumerState<SelectedCar> {
  TextEditingController currentMapController = TextEditingController();
  TextEditingController goingToEditingController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  int numberOfSeats = 1;
  final priceController = TextEditingController();
  final routeController = TextEditingController();

  String? _setTime, _setDate;

  String? _hour, _minute, _time;

  String? dateTime;
  bool isLoading = false;
  bool isSuccess = false;
  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = const TimeOfDay(hour: 00, minute: 00);
  var paymentMethod = 'Debit Card';

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = '${_hour!} : ${_minute!}';
        _timeController.text = _time!;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
    }
  }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  @override
  void dispose() {
    currentMapController.dispose();
    goingToEditingController.dispose();
    _timeController.dispose();
    _dateController.dispose();
    priceController.dispose();
    routeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dateTime = DateFormat.yMd().format(DateTime.now());
    final driverRideRef = ref.watch(DriverRideProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BorderButton(
            backgroundColor: white,
            color: black,
            onTap: () {
              Navigator.of(context).pop();
            },
            Icons: Icons.arrow_back,
            size: 20,
          ),
        ),
        title: Text(
          "Select Ride Preferences",
          style: TextStyle(
            color: black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Journey details",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: GlobaltextField(
                  controller: currentMapController,
                  preficIcon: const Icon(Icons.radio_button_checked),
                  label: "Current map location (Ikeja Lagos)"),
            ),
            const SizedBox(
              height: 20,
            ),
            GlobaltextField(
                keyboardType: TextInputType.text,
                u: true,
                controller: goingToEditingController,
                preficIcon: const Icon(
                  Icons.location_on,
                  color: Colors.green,
                ),
                label: "Where are you going to?"),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "What route are you passing?",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: GlobaltextField(
                  controller: routeController,
                  preficIcon: const Icon(Icons.radio_button_checked),
                  label: "Ikeja"),
            ),  const SizedBox(
              height: 20,
            ),
            const Text(
              'When are you going?',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 30),
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: grey5,
                ),
                child: InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.calendar_month,
                          color: black,
                        ),
                        Expanded(
                          child: Container(
                            width: 100,
                            height: 55,
                            alignment: Alignment.center,
                            child: TextFormField(
                              style:  TextStyle(fontSize: 15, color:black),
                              textAlign: TextAlign.center,
                              enabled: false,
                              keyboardType: TextInputType.text,
                              controller: _dateController,
                              onSaved: (val) {
                                _setDate = val;
                              },
                              decoration: const InputDecoration(
                                disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                // labelText: 'Time',
                                contentPadding: EdgeInsets.only(top: 0.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 180,
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Text(
              'What time are you going?',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 30),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: grey5,
                ),
                child: InkWell(
                  onTap: () {
                    _selectTime(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.access_time,
                        ),
                        Expanded(
                          child: Container(
                            width: 100,
                            height: 55,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: null),
                            child: TextFormField(
                              style:  TextStyle(fontSize: 15, color:black),
                              textAlign: TextAlign.center,
                              onSaved: (val) {
                                _setTime = val;
                              },
                              enabled: false,
                              keyboardType: TextInputType.text,
                              controller: _timeController,
                              decoration: const InputDecoration(
                                disabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                // labelText: 'Time',
                                contentPadding: EdgeInsets.all(5),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 180,
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
             
            const Text(
              'How many seats are available',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 6),
              child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: grey5,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        BorderButton(
                            backgroundColor: grey5,
                            color: Colors.black45,
                            onTap: () {
                              setState(() {
                                while (true) {
                                  if (numberOfSeats == 1) {
                                    break;
                                  } else {
                                    numberOfSeats--;
                                  }
                                }
                              });
                            },
                            Icons: Icons.horizontal_rule,
                            size: 25),
                        const SizedBox(
                          width: 14,
                        ),
                        Text(
                          '$numberOfSeats',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        BorderButton(
                            backgroundColor: grey5,
                            color: Colors.black45,
                            onTap: () {
                              setState(() {
                                numberOfSeats++;
                              });
                            },
                            Icons: Icons.add,
                            size: 25),
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "What's your price?",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: GlobaltextField(
                  controller: priceController,
                  preficIcon: const Icon(Icons.radio_button_checked),
                  label: "\$100"),
            ),
              const SizedBox(
              height: 20,
            ),
            const Text(
              "Your preferred payment method",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 30),
          child: GlobalDroptextField(
                      hint: 'Yes',
                      onChanged: (value) {
                        setState(() {
                          paymentMethod = value as String;
                        });
                      },
                      selected: paymentMethod,
                      listTextFied: const [
                       'MyWallet', 'Debit Card',
                      ]),
        ),
           
            const SizedBox(
              height: 30,
            ),
            AppButton(
              textColor: white,
              buttonColor: black,
              label: "Create Trip",
              onPressed: () async {
                if (currentMapController.text.isNotEmpty&&goingToEditingController.text.isNotEmpty&&_dateController.text.isNotEmpty&&_dateController.text.isNotEmpty&&priceController.text.isNotEmpty&&routeController.text.isNotEmpty ){
  setState(() {

                  isLoading = true;
                });
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                final token = prefs.getString('token');
                 final rideMessage = await driverRideRef.driverStartTrip(

                    currentMapController.text,
                    goingToEditingController.text,
                    goingToEditingController.text,
                    numberOfSeats.toString(),
                    currentMapController.text,
                    goingToEditingController.text,
                    routeController.text,
                    selectedTime.toString(),
                    priceController.text,
                    paymentMethod,
                    token!);

                if (rideMessage == 'Ride created') {
                  setState(() {
                    isLoading = false;
                    isSuccess = true;
                  });
                } else {
                  setState(() {
                    isLoading = false;
                    isSuccess = false;
              
                  });
                   loadRide(isLoading, isSuccess, rideMessage);
                }
                }
else{
    WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text(
                                        'Fill up all fields',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                });
}
              },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      )),
    );
  }

  void loadRide(isLoading, isSuccess, message) {
    final createRideRef = ref.watch(bookRideProvider);
    String pickupLocation = '';
    String  dropOffLocation = '';
    String whenAreyouGoing = '';
    String  seatsAvailable = '';
    String currentMapLocation  = '';
    String whereAreyouGoing = '';
    String whatRouteAreYouPassing  = '';
    String whatTimeAreYouGoing = '';
    String price = '';
    String paymentMethod = '';
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        context: context,
        builder: (context) {
          return CustomPopUpContainer(
            child: isLoading
                ? LoadingAnimationWidget.inkDrop(color: successColor, size: 40)
                : isSuccess
                    ? Column(
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
                          const Text(
                              'Your Trip has been published and passengers can now book a seat.'),
                          const SizedBox(
                            height: 30,
                          ),
                          AppButton(
                              textColor: white,
                              onPressed: () {
                                //  Navigator.push(context, MaterialPageRoute(builder:(ccontext)=>MyWalletScreen()));
                              },
                              label: 'Proceed'),
                          const SizedBox(height: 20)
                        ],
                      )
                    : Column(
                        children: [
                          const SizedBox(height: 20),
                          SvgPicture.asset(svgerror, color: errorColor),
                          const SizedBox(
                            height: 20,
                          ),
                          Text('Error!', style: headline2(errorColor)),
                          const SizedBox(
                            height: 20,
                          ),
                           Text(message),
                          const SizedBox(
                            height: 30,
                          ),
                          AppButton(
                              textColor: white,
                              onPressed: () async{
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                setState(() {
                            pickupLocation = prefs.getString('pickupLocation')!;
                            dropOffLocation = prefs.getString('dropOffLocation')!;
                            whenAreyouGoing = prefs.getString('whenAreyouGoing')!;
                            seatsAvailable = prefs.getString('seatsAvailable')!;
                            currentMapLocation = prefs.getString('currentMapLocation')!;
                            whereAreyouGoing = prefs.getString('whereAreyouGoing')!;
                            currentMapLocation = prefs.getString('currentMapLocation')!;
                            whatRouteAreYouPassing = prefs.getString('whatRouteAreYouPassing')!;
                            whatTimeAreYouGoing =  prefs.getString('whatTimeAreYouGoing')!;
                            price = prefs.getString('price')!;
                            paymentMethod = prefs.getString('paymentMethod')!;
                                });
                                final token = prefs.getString('token');
                                createRideRef.getDriver(token!, );


                                //Navigator.pop(context);
                              },
                              label: 'Cancel'),
                          const SizedBox(height: 20)
                        ],
                      ),
          );
        });
  }
}