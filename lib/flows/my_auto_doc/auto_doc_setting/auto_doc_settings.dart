import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:myroute/flows/my_auto_doc/homescreen.dart';
import '../../../constants/app_color.dart';
import '../../../constants/app_image.dart';
import '../../../constants/textstyle.dart';
import '../../PassengerBookingFlow/global_file/globalDropTextField.dart';
import '../../PassengerBookingFlow/view/SearchingAvailableRide/SearchavailableRide_method.dart';
import '../../registration/Reg_global_File/App_button.dart';
import '../../registration/Reg_global_File/back_button.dart';
import '../my_car_fleet.dart';
import '../pay_renewal_fee.dart';
import 'doctype.dart';


class AutoDocSettings extends StatefulWidget {
  const AutoDocSettings({Key? key}) : super(key: key);

  @override
  State<AutoDocSettings> createState() => _AutoDocSettingsState();
}

class _AutoDocSettingsState extends State<AutoDocSettings> {

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _yesNoController = TextEditingController();
  final TextEditingController _carDocumentType = TextEditingController();
  String? selected3 = 'Yes';

  String? name;
  bool isPressed = true;

  void successs(){
    showModalBottomSheet(context: context, builder: (context){
      return CustomPopUpContainer(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          children: [
            SvgPicture.asset(success),
            SizedBox(height: 15,),
            Text('Success!', style: body1(primaryColor, TextDecoration.none),),
            SizedBox(height: 15,),
            Text('Your AutoDoc settings has been saved', style: body2(black, TextDecoration.none),),
            SizedBox(height: 30,),
            AppButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyCarFleet(),
                      ));
            }, label: 'Go back to My Car Fleet'),
            SizedBox(height: 20,),
            AppButton(
              textColor: black,
              buttonColor: white,
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PayRenewalFee(),
                      ));
                }, label: 'Exit')
          ],
        ),
      );
    });
  }



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

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        leading: AppBackButton(),
        centerTitle: true,
        title: Text('My AutoDoc', style: body1(black, TextDecoration.none),),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('2010 Range Rover Sport', style: headline2(black,),),
              SizedBox(height: 10),
              Row(
                children: [
                  SvgPicture.asset(coloredlicense),
                  Text('Reg no: AE451KEH'),
                ],
              ),
              SizedBox(height: 20),
              Text('Select Car Document type', style: body1(black, TextDecoration.none)),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 30),
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: grey1,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isPressed ? Container(
                          child: Row(
                            children: [
                              CarDoc(
                                onPressed: (){
                                  setState(() {
                                    isPressed = false;
                                    name = 'Driver\'s License';
                                  });
                                },
                                name: 'Driver\'s License',
                              ),
                              SizedBox(width: 2,
                              ),
                              CarDoc(
                                onPressed: (){
                                  setState(() {
                                    isPressed = false;
                                    name = 'Road worthiness';
                                  });
                                },
                                name: 'Road worthiness',
                              )
                            ],
                          ),
                        ) : Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text('$name'),
                        ),
                        const Icon(Icons.arrow_drop_down,
                          color: primaryColor,),
                      ],
                    ),
                  ),
                ),
              ),


              Text('When is your license expiring?', style: body1(black, TextDecoration.none)),

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
                          Icon(Icons.calendar_month,
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
                          const Icon(Icons.arrow_drop_down,
                            color: primaryColor,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Text('NOTE Renewal Cost: N50,000.00', style: body1(Colors.red, TextDecoration.none)),
              SizedBox(height: 25,),

              Text('Do you want us to Auto renew for you?', style: body1(black, TextDecoration.none)),

              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 30),
                child: GlobalDroptextField(
                    hint: 'Yes',
                    onChanged: (value) {
              setState(() {
            selected3 = value as String;
              });
              },
                    selected: '$selected3',
                    listTextFied: const [
                      'Yes',
                      'No',
                    ]),
              ),

              Text('Account to Debit for Auto renewal', style: body1(black, TextDecoration.none)),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 30),
                child: GlobalDroptextField(
                    hint: 'My AutoSave wallet',
                    selected: '',
                    listTextFied: const [

                    ]),
              ),

              SizedBox(height: 20,),
              AppButton(
                  onPressed: () {
                    successs();
                  },
                  label: "Save AutoDoc settings"),

            ],
          ),
        ),
      ),
    );
  }

}