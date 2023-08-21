import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_color.dart';
import '../../constants/app_image.dart';
import '../../constants/textstyle.dart';
import '../PassengerBookingFlow/global_file/globalDropTextField.dart';
import '../PassengerBookingFlow/view/SearchingAvailableRide/SearchavailableRide_method.dart';
import '../registration/Reg_global_File/App_button.dart';
import '../registration/Reg_global_File/back_button.dart';
import 'auto_save_details.dart';


class AutoSaveParemeters extends StatefulWidget {
  const AutoSaveParemeters({Key? key}) : super(key: key);

  @override
  State<AutoSaveParemeters> createState() => _AutoSaveParemetersState();
}

class _AutoSaveParemetersState extends State<AutoSaveParemeters> {

  void AutoSaveSuccess(){
    showModalBottomSheet(shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))

    ), context: context, builder: (context){
      return CustomPopUpContainer(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: SvgPicture.asset( success, color: primaryColor,)),
            SizedBox(height: 15,),
            Center(child: Text('Success!', style: headline1(primaryColor),)),
            SizedBox(height: 20,),
            Center(child: Text('Your AutoSave settings have been saved', style: body3(black, TextDecoration.none),)),
            SizedBox(height: 30,),
            AppButton(
                onPressed: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AutoSaveDetails()));
                }, label: 'Exit'),
            SizedBox(height: 20,),
          ],
        ),
      );
    });
  }

  String savingsTarget = "Driver's License renewal fee";
  String amountToSave = "2,000";
  String  howOften = "Monthly Savings";
  String howLong = "3 months";
  String accountToDebit = "My Debit Card";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        leading: AppBackButton(),
        centerTitle: true,
        title: Text('My AutoSave', style: body1(black, TextDecoration.none),),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Set your AutoSave Parameters', style: headline2(black,),),

              SizedBox(height: 20),
              Text('What is your savings target?', style: body1(black, TextDecoration.none)),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 30),
                child: GlobalDroptextField(
                    onChanged: (value) {
                      setState(() {
                        savingsTarget = value as String;
                      });
                    },
                    selected: '$savingsTarget',
                    listTextFied: const [
                      "Driver's License renewal fee",
                      'Road Worthiness',
                    ]),
              ),

              Text('How much do you want to save?', style: body1(black, TextDecoration.none)),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 30),
                child: GlobalDroptextField(
                    onChanged: (value) {
                      setState(() {
                        amountToSave = value as String;
                      });
                    },
                    selected: '$amountToSave',
                    listTextFied: const [
                      "2,000",
                      '3,000',
                    ]),
              ),

              Text('NOTE Renewal Cost: N50,000.00', style: body1(Colors.red, TextDecoration.none)),
              SizedBox(height: 25,),

              Text('How often do you want to save', style: body1(black, TextDecoration.none)),

              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 30),
                child: GlobalDroptextField(
                    hint: 'Yes',
                    onChanged: (value) {
                      setState(() {
                        howOften = value as String;
                      });
                    },
                    selected: '$howOften',
                    listTextFied: const [
                      'Monthly Savings',
                      'Weekly savings',
                    ]),
              ),

              SizedBox(height: 25,),

              Text('How long do you want to save for?', style: body1(black, TextDecoration.none)),

              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 30),
                child: GlobalDroptextField(
                    hint: 'Yes',
                    onChanged: (value) {
                      setState(() {
                        howLong = value as String;
                      });
                    },
                    selected: '$howLong',
                    listTextFied: const [
                      '3 months',
                      '2 months',
                    ]),
              ),

              SizedBox(height: 25,),

              Text('Account to Debit for your AutoSave target', style: body1(black, TextDecoration.none)),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 30),
                child: GlobalDroptextField(
                    hint: 'Yes',
                    onChanged: (value) {
                      setState(() {
                        accountToDebit = value as String;
                      });
                    },
                    selected: '$accountToDebit',
                    listTextFied: const [
                      'My Debit Card',
                      'My Wallet',
                    ]),
              ),

              SizedBox(height: 20,),
              AppButton(
                  onPressed: () {
                    AutoSaveSuccess();
                  },
                  label: "Save AutoDoc settings"),

            ],
          ),
        ),
      ),
    );
  }
}