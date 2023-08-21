import 'package:flutter/material.dart';
import 'package:myroute/flows/my_carEarn/rent_a_car/select_car_to_rent.dart';
import 'package:myroute/flows/my_carEarn/rent_out_mycar_screen.dart';
import 'package:myroute/flows/registration/Reg_global_File/App_button.dart';

import '../../constants/app_color.dart';
import '../../constants/app_image.dart';
import '../../constants/textstyle.dart';
import '../registration/Reg_global_File/back_button.dart';


class MyCarEarnHome extends StatefulWidget {
  const MyCarEarnHome({Key? key}) : super(key: key);

  @override
  State<MyCarEarnHome> createState() => _MyCarEarnHomeState();
}

class _MyCarEarnHomeState extends State<MyCarEarnHome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        leading: AppBackButton(),
        centerTitle: true,
        title: Text('My CarEarn', style: body1(black, TextDecoration.none),),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Image.asset(earnandman),
              const SizedBox(height: 20,),
              Text('Introducing My CarEarn', style: headline2(black),),
              const SizedBox(height: 20,),
              Row(
                  children: [
                    Padding(padding: const EdgeInsets.only(bottom: 12),
                      child: Text('.', style: headline1(black)),
                    ),
                    const SizedBox(width: 20,),
                    SizedBox(
                      width: size.width * 0.9,
                      child: Text('Rent out your car on your terms and conditions and earn money',
                        style: body4(black, TextDecoration.none),
                        softWrap: true,
                        maxLines: 1000, overflow: TextOverflow.visible,),),]),
              const SizedBox(height: 20,),
              Row(
                  children: [
                    Padding(padding: const EdgeInsets.only(bottom: 12),
                      child: Text('.', style: headline1(black)),
                    ),
                    const SizedBox(width: 20,),
                    SizedBox(
                      width: size.width * 0.9,
                      child: Text('Rent a car and earn money strictly on the terms of the car owner',
                        style: body4(black, TextDecoration.none),
                        softWrap: true,
                        maxLines: 1000, overflow: TextOverflow.visible,),),]),
              const SizedBox(height: 40,),

              AppButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => RentOutMyCar()),);
              }, label: "Rent out Car from your fleet"),
              const SizedBox(height: 30,),
              AppButton(textColor: black, buttonColor: white, onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SelectCarToRent()),);
              }, label: "Rent a car from a Car owner")
            ],
          ),
        ),
      ),
    );
  }
}