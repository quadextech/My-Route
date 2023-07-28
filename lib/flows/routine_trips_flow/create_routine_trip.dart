import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:myroute/constants/app_image.dart';
import 'package:myroute/constants/textstyle.dart';
import 'package:myroute/flows/PassengerBookingFlow/global_file/global_file.dart';
import 'package:myroute/flows/registration/Reg_global_File/back_button.dart';
import 'package:myroute/flows/registration/Reg_global_File/globalfile.dart';
import 'package:myroute/flows/routine_trips_flow/widgets/textfield_widget.dart';

import '../../constants/app_color.dart';
import '../PassengerBookingFlow/global_file/swicher.dart';
import '../PassengerBookingFlow/view/select_car_preferences/models/BorderButton.dart';

class CreateRoutineTrip extends StatefulWidget {
  const CreateRoutineTrip({super.key});

  @override
  State<CreateRoutineTrip> createState() => _CreateRoutineTripState();
}

class _CreateRoutineTripState extends State<CreateRoutineTrip> {
  final tripTitleController = TextEditingController();
  final preferredRouteController = TextEditingController();
  final goingToEditingController = TextEditingController();
  final currentMapController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
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
        dateController.text = DateFormat.yMd().format(selectedDate);
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
        timeController.text = _time!;
        timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    tripTitleController.dispose();
    preferredRouteController.dispose();
    goingToEditingController.dispose();
    currentMapController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: const Swicher(),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: AppBackButton(),
        ),
        body: SingleChildScrollView(physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: size.height * 0.25,
                  width: double.infinity,
                  child:
                      Image.asset('assets/images/map.png', fit: BoxFit.fill)),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create MyRoutine Trip',
                      style: headline2(primaryColor),
                    ),
                    Text(
                      'You are currently on passenger mode',
                      style: body4(black, TextDecoration.none),
                    ),
                    const SizedBox(height: 20),
                    Text('Trip title', style: body3(black, TextDecoration.none)),
                    const SizedBox(height: 10),
                    RoutineTextField(
                        controller: tripTitleController,
                        hint: 'Give your trip a name'),
                    const SizedBox(height: 20),
                    Text('What\'s your preferred route?', style: body3(black, TextDecoration.none)),
                    const SizedBox(height: 10),
                    GlobalDroptextField(
                        prificIcon: SvgPicture.asset(svgroute),
                        selected: 'Ikeja - Ikorodu way',
                        listTextFied: const [
                          'Ikeja - Ikorodu way',
                          "Ikeja - Express way",
                          "Ibadan Express way",
                          "BolaLe Street",
                        ]),
                    const SizedBox(height: 20),
                    Text('Journey Details', style: body3(black, TextDecoration.none)),
                    const SizedBox(height: 10),
                    GlobaltextField(
                        controller: currentMapController,
                        preficIcon:
                            const Icon(Icons.radio_button_checked_outlined),
                        label: "Current map location (Ikeja Lagos)"),
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
                        const SizedBox(height: 20),
                    const Text(
                      'When are you going?',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: grey,
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
                                    controller: dateController,
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
                    const SizedBox(height: 10),
                    const Text(
                      'What time are you going?',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: grey,
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
                              Container(
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
                                  controller: timeController,
                                  decoration: const InputDecoration(
                                    disabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    // labelText: 'Time',
                                    contentPadding: EdgeInsets.all(5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                              const Text(
                                'How many seats are you booking?',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 10),
                    Container(
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: grey,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              BorderButton(
                                  backgroundColor: grey,
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
                                  backgroundColor: grey,
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
                  ],
                ),
              )
            ],
          ),
        ));
  }
}