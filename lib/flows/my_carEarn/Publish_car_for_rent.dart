import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_color.dart';
import '../../constants/app_image.dart';
import '../../constants/textstyle.dart';
import '../PassengerBookingFlow/global_file/globalDropTextField.dart';
import '../PassengerBookingFlow/view/SearchingAvailableRide/SearchavailableRide_method.dart';
import '../registration/Reg_global_File/App_button.dart';
import '../registration/Reg_global_File/back_button.dart';

class PublishCarForRent extends StatefulWidget {
  const PublishCarForRent({Key? key}) : super(key: key);

  @override
  State<PublishCarForRent> createState() => _PublishCarForRentState();
}

class _PublishCarForRentState extends State<PublishCarForRent> {

  String howLongToRent = '3 months';
  String totalEarningPercent = '60% on every Passenger';
  String  earningsPerDayIfCarIdle = 'N500.00';
  String ReceiveNotificationOnCarAct = 'Yes';


  void PublishCarForRentSuccess(){
    showModalBottomSheet(shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))

    ), context: context, builder: (context){
      Size size = MediaQuery.of(context).size;
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


            SizedBox(
              width: size.width * 0.95,
              child: Center(
                child: Text('Your Car has been published for rent. You will be notified when you have a suitor',
                  style: body4(black, TextDecoration.none),
                  softWrap: true, maxLines: 1000, overflow: TextOverflow.visible,),
              ),),
            SizedBox(height: 30,),
            AppButton(
                onPressed: (){
                  Navigator.pop(context);
                //   Navigator.push(context, MaterialPageRoute(builder: (context)=> AutoSaveDetails()));
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
        title: Text('Rent out MyCar', style: body1(black, TextDecoration.none),),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('2010 Range Rover Sport', style: headline2(black,),),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          SvgPicture.asset(coloredlicense),
                          Text('Reg no: AE451KEH'),
                        ],
                      ),

                    ],
                  ),
                  SizedBox(width: 10,),
                ],
              ),
              SizedBox(height:50,),

              Text('How long do you want to rent your car out for?', style: body1(black, TextDecoration.none)),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: GlobalDroptextField(
                    onChanged: (value) {
                      setState(() {
                       howLongToRent = value as String;
                      });
                    },
                    selected: '$howLongToRent',
                    listTextFied: const [
                      '3 months',
                      'Others',
                    ]),
              ),

             SizedBox(height: 40,),

              Text('Total earnings percentage', style: body1(black, TextDecoration.none)),

              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 50),
                child: GlobalDroptextField(
                    onChanged: (value) {
                      setState(() {
                       totalEarningPercent = value as String;
                      });
                    },
                   selected: '$totalEarningPercent',
                    listTextFied: const [
                      '60% on every Passenger',
                      'Others',
                    ]),
              ),

              Text('Earnings per day if Car is idle', style: body1(black, TextDecoration.none)),

              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 30),
                child: GlobalDroptextField(
                    onChanged: (value) {
                      setState(() {
                       earningsPerDayIfCarIdle = value as String;
                      });
                    },
                    selected: '$earningsPerDayIfCarIdle',
                    listTextFied: const [
                      'N500.00',
                      'Others',
                    ]),
              ),

              Text('Receive notification on Car activities', style: body1(black, TextDecoration.none)),

              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 30),
                child: GlobalDroptextField(
                    onChanged: (value) {
                      setState(() {
                        ReceiveNotificationOnCarAct = value as String;
                      });
                    },
                    selected: '$ReceiveNotificationOnCarAct',
                    listTextFied: const [
                      'Yes',
                      'No',
                    ]),
              ),

              SizedBox(height: 70,),
              AppButton(onPressed: (){
                PublishCarForRentSuccess();
              }, label: "Publish Car for Rent")
            ],
          ),
        ),
      ),

    );

  }
}