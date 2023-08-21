import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myroute/flows/registration/Reg_global_File/App_button.dart';

import '../../constants/app_color.dart';
import '../../constants/app_image.dart';
import '../../constants/textstyle.dart';
import '../PassengerBookingFlow/view/SearchingAvailableRide/SearchavailableRide_method.dart';
import '../registration/Reg_global_File/back_button.dart';

class AutoSaveDetails extends StatefulWidget {
  const AutoSaveDetails({Key? key}) : super(key: key);

  @override
  State<AutoSaveDetails> createState() => _AutoSaveDetailsState();
}

class _AutoSaveDetailsState extends State<AutoSaveDetails> {

  void deleteAutoSave(){
    showModalBottomSheet(shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))

    ),context: context, builder: (context){
      return CustomPopUpContainer(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          children: [
            SvgPicture.asset(delete),
            SizedBox(height: 15,),
            Text('Deleted!', style: body1(Colors.red, TextDecoration.none),),
            SizedBox(height: 15,),
            Text('Your AutoDoc settings have been deleted', style: body2(black, TextDecoration.none),),
            SizedBox(height: 30,),
            AppButton(
                onPressed: (){
                }, label: 'Exit'),
            SizedBox(height: 20,),
            AppButton(
                textColor: black,
                buttonColor: white,
                onPressed: (){
                }, label: 'Undo Delete')
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
        title: Text('My AutoSave details', style: body1(black, TextDecoration.none),),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Text("Driver's License renewal fee", style: headline3(primaryColor),),
              SizedBox(height: 10,),
              Text('N 2,000.00', style: headline1(black),),
              Row(
                children:[
                  Text('3 months schedule'),
                  SizedBox(width: 10,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text('.', style: headline1(black),),
                  ),
                  SizedBox(width: 5,),
                  Text('Monthly savings deduction'),
                ],
              ),
              SizedBox(height: 25,),


              ListTile(
                title: Text('Savings Debit from'),
                trailing: Text('Debit Card', style: headline3(black),),
              ),
              SizedBox(height: 10,),
              Container(
                color: grey,
                height: 2,
                width: size.width,
              ),
              SizedBox(height: 20,),
              ListTile(
                title: Text('Recipient'),
                trailing: Text('My AutoSave', style: headline3(black)),
              ),
              SizedBox(height: 10,),
              Container(
                color: grey,
                height: 2,
                width: size.width,
              ),
              SizedBox(height: 20,),
              ListTile(
                title: Text('Transaction Timeline'),
                trailing: Text('Monthly debit', style: headline3(black)),
              ),
              SizedBox(height: 10,),
              Container(
                color: grey,
                height: 2,
                width: size.width,
              ),
              SizedBox(height: 20,),
             ListTile(
                title: Text('Amount'),
                trailing: Text('N2,000.00', style: headline3(black)),
              ),
              SizedBox(height: 10,),
              Container(
                color: grey,
                height: 2,
                width: size.width,
              ),
              SizedBox(height: 20,),
             ListTile(
                title: Text('Reference'),
                trailing: Text('YN66BUIK',  style: headline3(black)),
              ),
              SizedBox(height: 10,),
              Container(
                color: grey,
                height: 2,
                width: size.width,
              ),
              SizedBox(height: 20,),
              ListTile(
                title: Text('My AutoSave balance', ),
                trailing: Text('N 2,000.00', style: headline3(black)),
              ),
              SizedBox(height: 50,),

              AppButton(
                  borderColor: Colors.red,
                  textColor: Colors.red,
                  buttonColor: white,
                  onPressed: (){
                    deleteAutoSave();
                  }, label: 'Delete AutoSave'),

            ],
          ),
        ),
      ),
    );
  }
}