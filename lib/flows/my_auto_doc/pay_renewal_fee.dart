import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_color.dart';
import '../../constants/app_image.dart';
import '../../constants/textstyle.dart';
import '../PassengerBookingFlow/view/SearchingAvailableRide/SearchavailableRide_method.dart';
import '../registration/Reg_global_File/App_button.dart';
import '../registration/Reg_global_File/back_button.dart';
import '../registration/Reg_global_File/custom_text_field.dart';


class PayRenewalFee extends StatefulWidget {
  const PayRenewalFee({Key? key}) : super(key: key);

  @override
  State<PayRenewalFee> createState() => _PayRenewalFeeState();
}

class _PayRenewalFeeState extends State<PayRenewalFee> {

  bool isChecked = false;
  bool passwordError = false;
 TextEditingController passwordCcontroller = TextEditingController();
 bool toProceed = false;
 bool isscuccess = false;

  void PaymentOptions(){
    showModalBottomSheet(context: context, builder: (context){
     return CustomPopUpContainer(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text('Choose where to pay from', style: headline1(black)),
            ),
            SizedBox(height: 10,),
            ListTile(
              title: Text('MyRoute balance', style: body3(black, TextDecoration.none),),
              leading: SvgPicture.asset(svgwallet, color: primaryColor,),
              trailing: CheckBox(),
            ),
            ListTile(
              title: Text('Mastercard 19********098', style: body3(black, TextDecoration.none),),
              leading: SvgPicture.asset(atmcard, color: primaryColor,),
              trailing: CheckBox(),
            ),
            ListTile(
              title: Text('My AutoSave balance', style: body3(black, TextDecoration.none),),
              leading: SvgPicture.asset(svgAutosave, height: 33, width: 33, color: primaryColor,),
              trailing: CheckBox(),
            ),
            ListTile(
              title: Text('Add debit card', style: body3(black, TextDecoration.none),),
              leading: SvgPicture.asset(atmcard, color: primaryColor,),
              trailing: CheckBox(),
            ),
            SizedBox(height: 20,),
            AppButton(
                onPressed: (){
                  Navigator.pop(context);
                  EnterPassword();
                }, label: 'Proceed'),
          ],
        ),
      );
    });
  }


  void Pay(){

    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(context: context, builder: (context){
      return CustomPopUpContainer(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text('N50,000', style: headline4(black))),
            SizedBox(height: 35,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Description', style: body2(black, TextDecoration.none),),
      Text("Driver's License renewal", style: headline2(black),)],),
            SizedBox(height: 10,),
            Divider(color: grey, thickness: 1,),
            SizedBox(height: 10,),
            ListTile(
              title: Text('MyRoute balance', style: body3(black, TextDecoration.none),),
              leading: SvgPicture.asset(svgwallet, color: primaryColor,),
              trailing: Text('N 5,000.00'),
            ),
            SizedBox(height: 5,),
           // Container(
           //    height: 40,
           //    width: size.width,
           //    color: isinsufficient ? Colors.red: null,
           //    child: isinsufficient ? Row(
           //      children: [
           //        Padding(
           //          padding: const EdgeInsets.only(left: 10),
           //          child: Icon(Icons.error, color: white, size: 20,),
           //        ),
           //        SizedBox(width: 10,),
           //        Text('insufficient funds in your MyWallet Balance', style: body3(white, TextDecoration.none),),
           //      ],
           //    ) :  null),

            SizedBox(height: 10,),

            AppButton(
                onPressed: (){
                  Navigator.pop(context);
                  PaySuccess();
                  setState(() {
                    isscuccess = true;
                  });
                }, label: 'Pay'),
            SizedBox(height: 20,),

            AppButton(
      buttonColor:  white,
                textColor: black,
                onPressed: (){
                  Navigator.pop(context);
                  PaymentOptions();
                }, label: 'Change Payment method'),
          ],
        ),
      );
    });
  }

  void PaySuccess(){
    showModalBottomSheet(context: context, builder: (context){
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
            Center(child: Text('Your Drivers license renewal is being processed!', style: body3(black, TextDecoration.none),)),
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



  void EnterPassword(){
    showModalBottomSheet(context: context, builder: (context){
      return CustomPopUpContainer(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Please enter your MyRoute Password', style: headline1(black)),
            SizedBox(height: 30,),

            mytextField(errorCondition: passwordError,
              error: 'Incorrect password',
              label: "Password",
              controller: passwordCcontroller,
              ispassword: true,
            ),
            SizedBox(height: 30,),
              RichText(
              text: TextSpan(
      children: [
      TextSpan(
      text: 'Having some trouble? ',
      style: body3(black, TextDecoration.none)),

      TextSpan(
      text: 'Reset your Password',
      style: body3(primaryColor, TextDecoration.none)),

      ])),
            SizedBox(height: 30,),

            AppButton(
                onPressed: (){
                  Navigator.pop(context);
                  Pay();
                }, label: 'Confirm password'),
          ],
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            children: [
              SizedBox(height: 10,),
              Row(
                children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('2010 Range Rover Sport', style: headline2(black,),),
                        Row(
                          children: [
                            SvgPicture.asset(coloredlicense),
                            Text('Reg no: AE451KEH'),
                          ],
                        ),

                      ],
                    ),
                  SizedBox(width: 10,),
                  Image.asset(blackcar, width: 120, height: 120, fit: BoxFit.cover,),
                ],
              ),
              SizedBox(height: 30,),
              isscuccess ? Text("Your Driver's License is being processed !",  style: headline1(Colors.red,), ) : Text("Your Driver's License is expired !",  style: headline1(Colors.red,), ),
              SizedBox(height: 20,),
              Text('Renewal cost: 50,000'),
              SizedBox(
                height: size.height*0.4,
              ),
              AppButton(
                  onPressed: () {
                    PaymentOptions();
                  },
                  label: "Pay Renewal fee"),

            ],
          ),
        ),
      ),
    );
  }
}

class CheckBox extends StatefulWidget {
  const CheckBox({Key? key}) : super(key: key);

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: primaryColor,
        fillColor: MaterialStateProperty.all(primaryColor),
        value: isChecked,
        onChanged: (bool? value){
          setState(() {
            isChecked = value!;
          });
        });
  }
}