import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myroute/flows/registration/Reg_global_File/App_button.dart';

import '../../constants/app_color.dart';
import '../../constants/app_image.dart';
import '../../constants/textstyle.dart';
import '../PassengerBookingFlow/global_file/globalDropTextField.dart';
import '../PassengerBookingFlow/view/SearchingAvailableRide/SearchavailableRide_method.dart';
import '../registration/Reg_global_File/back_button.dart';

class AutoInsureSettings extends StatefulWidget {
  const AutoInsureSettings({Key? key}) : super(key: key);

  @override
  State<AutoInsureSettings> createState() => _AutoInsureSettingsState();
}

class _AutoInsureSettingsState extends State<AutoInsureSettings> {

  String wantToAutoRenew  = 'Yes';
  String accountToCredit = 'My Debit Card';
  String carInsuranceType =  'Liability Coverage';

  void InsureSettinsSuccess(){
    showModalBottomSheet(shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))

    ),context: context, builder: (context){
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
            Center(child: Text('Your AutoInsure settings have been saved', style: body3(black, TextDecoration.none),)),
            SizedBox(height: 30,),
            AppButton(
                onPressed: (){
                  Navigator.pop(context);
                }, label: 'Exit'),
            SizedBox(height: 20,),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        leading: AppBackButton(),
        centerTitle: true,
        title: Text('My AutoInsure', style: body1(black, TextDecoration.none),),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Set your AutoInsure policy', style: headline3(black),),
              SizedBox(height:50,),

              Text('Select Car Insurance type', style: body1(black, TextDecoration.none)),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: GlobalDroptextField(
                    onChanged: (value) {
                      setState(() {
                        carInsuranceType = value as String;
                      });
                    },
                    selected: '$carInsuranceType',
                    listTextFied: const [
                      'Liability Coverage',
                      'Others',
                    ]),
              ),

              Text('NOTE Insurance Cost: N50,000.00 (1 year validity)', style: body1(Colors.red, TextDecoration.none)),
              SizedBox(height: 40,),

              Text('Account to Debit for your AutoInsure policy', style: body1(black, TextDecoration.none)),

              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 50),
                child: GlobalDroptextField(
                    onChanged: (value) {
                      setState(() {
                        accountToCredit = value as String;
                      });
                    },
                    selected: '$accountToCredit',
                    listTextFied: const [
                      'My Debit Card',
                      'Others',
                    ]),
              ),

              Text('Do you want us to Auto renew your Insurance', style: body1(black, TextDecoration.none)),

              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 30),
                child: GlobalDroptextField(
                    onChanged: (value) {
                      setState(() {
                        wantToAutoRenew = value as String;
                      });
                    },
                    selected: '$wantToAutoRenew',
                    listTextFied: const [
                      'Yes',
                      'No',
                    ]),
              ),
              SizedBox(height: 300,),

              AppButton(onPressed: (){
                InsureSettinsSuccess();
              }, label: "Save AutoInsure settings")
            ],
          ),
        ),
      ),
    );
  }
}