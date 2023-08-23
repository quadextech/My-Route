import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myroute/flows/registration/Reg_global_File/App_button.dart';

import '../../constants/app_color.dart';
import '../../constants/app_image.dart';
import '../../constants/textstyle.dart';
import '../PassengerBookingFlow/view/SearchingAvailableRide/SearchavailableRide_method.dart';
import '../registration/Reg_global_File/back_button.dart';
import 'PointAndRewardHome.dart';
import 'Utilities/PointsContainer.dart';
import 'Utilities/airtimeContainer.dart';
import 'Utilities/pointhistoryContainer.dart';


class RedeemPoints extends StatefulWidget {
  const RedeemPoints({Key? key}) : super(key: key);

  @override
  State<RedeemPoints> createState() => _RedeemPointsState();
}

class _RedeemPointsState extends State<RedeemPoints> {

  void RedeemPointSuccess(){
    showModalBottomSheet(shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))

    ), context: context, builder: (context){
      Size size = MediaQuery.of(context).size;
      return CustomPopUpContainer(
        height: MediaQuery.of(context).size.height * 0.45,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: SvgPicture.asset( success, color: successColor,)),
            SizedBox(height: 15,),
            Center(child: Text('Success!', style: headline1(successColor),)),
            SizedBox(height: 20,),


      Center(child: Text("You have redeemed 500 points to NGN100 airtime", style: body3(black, TextDecoration.none),)),

            SizedBox(height: 30,),
            AppButton(
                onPressed: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PointAndRewardHome()));
                }, label: 'Exit'),

          ],
        ),
      );
    });
  }

final controller = ConfettiController();
  
bool isPlaying = true;

@override
void initState(){
  super.initState();
 
  
}

@override
void dispose(){
  controller.dispose();
  super.dispose();
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
        title: Text(
          'Redeem Points',
          style: body1(black, TextDecoration.none),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: size.width,
                    height: size.height*0.25,
                    color: black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ConfettiWidget(
      confettiController: controller,
      shouldLoop:false,blastDirection: 180,
      blastDirectionality: BlastDirectionality.explosive,
      minBlastForce: 1,maxBlastForce:20,
      gravity:0.5,
      emissionFrequency: 0.50,
      numberOfParticles: 10,
      
    ),
                        CircleAvatar(backgroundColor: white, radius: 45.0,
                            child: Image.asset(reward,)),
                        Text('500', style: body1(white, TextDecoration.none),),
                        Text('Available MyRoute points', style: body4(white, TextDecoration.none)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Center(child: Text('Convert your MyRoute points to airtime', style: body4(black, TextDecoration.none),)),
              SizedBox(height: 10,),
              Center(child: Text('500 Points = NGN100 airtime',style: body3(black,TextDecoration.none))),
              SizedBox(height: 45,),

              Text('Enter Points', style: body3(black, TextDecoration.none),),

          SizedBox(height: 15,),

              AirtimeContainer(
                maintext: 'MyRoute points',
                points: '500',
                airtime: 'NGN100',
              ),


              SizedBox(height: 10,),

              Text('minimum of 500 points to redeem', style: body4(errorColor, TextDecoration.none),),

              SizedBox(height: 40,),

              AppButton(onPressed: (){
                controller.play();
                RedeemPointSuccess();
                 Future.delayed(Duration(seconds: 5), () {
      controller.stop();
    });
              }, label: 'Redeem now'),
             
    

          ]
          ),
        ),
      ),
    );
  }
}