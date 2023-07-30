import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myroute/flows/PassengerBookingFlow/global_file/global_file.dart';
import 'package:myroute/flows/PassengerBookingFlow/view/SearchingAvailableRide/SearchingAvailbleRides.dart';
import 'package:provider/provider.dart';
import '../../../../../constants/app_color.dart';
import '../../../../../constants/app_image.dart';
import '../../../../registration/Reg_global_File/App_button.dart';
import '../../../../registration/SignUp/views/Sign_up.dart';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../BookRideHomePage/model/HomePage.dart';
import '../../BookRideHomePage/model/homepageUI.dart';
import 'BorderButton.dart';

class SelectedCar extends StatefulWidget {
  const SelectedCar({super.key});

  @override
  State<SelectedCar> createState() => _SelectedCarState();
}

class _SelectedCarState extends State<SelectedCar> {
  TextEditingController currentMapController = TextEditingController();
  TextEditingController goingToEditingController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  int numberOfSeats = 1;

  String? _setTime, _setDate;

  String? _hour, _minute, _time;

  String? dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = const TimeOfDay(hour: 00, minute: 00);

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
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
  Widget build(BuildContext context) {
    dateTime = DateFormat.yMd().format(DateTime.now());
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
              padding: EdgeInsets.only(top: 18),
              child: GlobaltextField(
                  controller: currentMapController,
                  preficIcon: const Icon(Icons.radio_button_checked),
                  label: "Current map location (Ikeja Lagos)"),
            ),
            const SizedBox(
              height: 20,
            ),
            GlobaltextField(
                keyboardType: TextInputType.none,
                u: true,
                controller: goingToEditingController,
                preficIcon: const Icon(
                  Icons.location_on,
                  color: Colors.green,
                ),
                label: "Where are you going to?"),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "What’s your preferred route?",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 30),
              child: GlobalDroptextField(
                  prificIcon: SvgPicture.asset(svgroute),
                  selected: 'Ikeja - Ikorodu way',
                  listTextFied: const [
                    'Ikeja - Ikorodu way',
                    "Ikeja - Express way",
                    "Ibadan Express way",
                    "BolaLe Street",
                  ]),
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
                  color: grey1,
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
                              style: const TextStyle(fontSize: 15),
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
                  color: grey1,
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
                              style: const TextStyle(fontSize: 15),
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
              'How many seats are you booking?',
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
                    color: grey1,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        BorderButton(
                            backgroundColor: grey1,
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
                            backgroundColor: grey1,
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
              height: 30,
            ),
            AppButton(
              buttonColor: black,
              label: "Search for ride",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PassengerHomeScreen(),
                    ));
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
}
