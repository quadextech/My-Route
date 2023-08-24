import 'package:flutter/material.dart';
import 'package:myroute/constants/textstyle.dart';

import '../../constants/app_color.dart';
import '../../constants/app_image.dart';
import '../PassengerBookingFlow/view/select_car_preferences/models/BorderButton.dart';
import '../registration/Reg_global_File/App_button.dart';
import '../registration/Reg_global_File/back_button.dart';
import 'my_car_fleet.dart';



class AutoDocHome extends StatelessWidget {
  const AutoDocHome({Key? key}) : super(key: key);

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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Image(image: AssetImage(carandkey)),
              Text('Introducing My AutoDoc', style: headline2(black),),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
          Text('.', style: headline1(black)),
          const SizedBox(width: 20,),
          SizedBox( width: 310,child: Text('View your registered Cars and their registration details',overflow: TextOverflow.visible, style: body4(black, TextDecoration.none),)),]),
              const SizedBox(height: 20,),
      
              Row(
                  children: [
                    Padding(padding: const EdgeInsets.only(bottom: 22),
                      child: Text('.', style: headline1(black)),
                    ),
                    const SizedBox(width: 20,),
                    SizedBox( width: 310,child: Text('Monitor the expiry dates of your Car documents',overflow: TextOverflow.visible, style: body4(black, TextDecoration.none),)),]),
              const SizedBox(height: 20,),
              Row(
                  children: [
                    Padding(padding: const EdgeInsets.only(bottom: 22),
                      child: Text('.', style: headline1(black)),
                    ),
                    const SizedBox(width: 20,),
                    SizedBox(
                      width: 310,
                      child: Text('Set an auto renewal of your Car documents upon expiration and get notified in due time prior to expiration',
                        style: body4(black, TextDecoration.none),
                        softWrap: true,
                         overflow: TextOverflow.fade,),),]),
              const SizedBox(height: 20,),
              Row(
                  children: [
                    Padding(padding: const EdgeInsets.only(bottom: 22),
                      child: Text('.', style: headline1(black)),
                    ),
                    const SizedBox(width: 20,),
                    SizedBox(
                        width: 310,
                        child: Text('Fund your Car documents renewal from your AutoSave wallet, MyRoute wallet or debit card',
                          style: body4(black, TextDecoration.none),
                          softWrap: true, maxLines: 1000, overflow: TextOverflow.visible,),),]),
              const SizedBox(height: 35,),
      
      
      
              AppButton(textColor: white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyCarFleet(),
                        ));
                  },
                  label: "Proceed"),
                    const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}