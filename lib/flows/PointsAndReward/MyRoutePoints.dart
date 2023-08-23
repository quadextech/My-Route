import 'package:flutter/material.dart';

import '../../constants/app_color.dart';
import '../../constants/app_image.dart';
import '../../constants/textstyle.dart';
import '../registration/Reg_global_File/back_button.dart';
import 'Redeem_points.dart';
import 'Utilities/PointsContainer.dart';
import 'Utilities/pointhistoryContainer.dart';


class MyRoutePoints extends StatefulWidget {
  const MyRoutePoints({Key? key}) : super(key: key);

  @override
  State<MyRoutePoints> createState() => _MyRoutePointsState();
}

class _MyRoutePointsState extends State<MyRoutePoints> {
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
          'Points and Reward',
          style: body1(black, TextDecoration.none),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width,
                height: size.height*0.25,
                color: black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(backgroundColor: white, radius: 45.0,
                        child: Image.asset(reward,)),
                    Text('500', style: headline4(white),),
                    Text('Available MyRoute points', style: body2(white, TextDecoration.none)),
                  ],
                ),
              ),
             SizedBox(height: 15,),

              PointsContainer(
                onpressed: (){

              }, maintext: 'Redeem MyRoute points',
                text: 'Convert your points to health insurance discount',
              ),
              PointsContainer(
                onpressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context) =>  RedeemPoints()));
                }, maintext: 'Redeem MyRoute points',
                text: 'Convert your points to airtime',

              ),

              PointsContainer(
                onpressed: (){

                }, maintext: 'Redeem MyRoute points',
                text: 'Convert your points to ride discounts',
              ),

              SizedBox(height: 20,),
              Text('MyRoute point history', style: body2(black, TextDecoration.none),),
              SizedBox(height: 15,),
              PointHistory(
                maintext: 'You completed a ride with Michael',
                text: '+50 points',
              ),
              SizedBox(height: 15,),
              PointHistory(
                maintext: 'You redeemed 100 points for a ride discount',
                text: '+50 points',
              ),
            ],
          ),
        ),
      ),
    );
  }
}