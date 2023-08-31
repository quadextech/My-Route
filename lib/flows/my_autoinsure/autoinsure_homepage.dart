import 'package:flutter/material.dart';
import 'package:myroute/flows/registration/Reg_global_File/App_button.dart';

import '../../constants/app_color.dart';
import '../../constants/app_image.dart';
import '../../constants/textstyle.dart';
import '../registration/Reg_global_File/back_button.dart';
import 'autoinsure_settings.dart';


class AutoInsureHome extends StatefulWidget {
  const AutoInsureHome({Key? key}) : super(key: key);

  @override
  State<AutoInsureHome> createState() => _AutoInsureHomeState();
}

class _AutoInsureHomeState extends State<AutoInsureHome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            children: [
              Image.asset(autoInsurePic),
              const SizedBox(height: 20,),
              Text('Introducing My AutoInsure', style: headline2(black),),
              const SizedBox(height: 20,),
              Row(
                  children: [
                    Padding(padding: const EdgeInsets.only(bottom: 22),
                      child: Text('.', style: headline1(black)),
                    ),
                    const SizedBox(width: 20,),
                    SizedBox(
                      width: size.width * 0.8,
                      child: Text('AutoInsure provides you with variations of Car Insurance policies and their prices for you to choose from',
                        style: body4(black, TextDecoration.none),
                        softWrap: true,
                        maxLines: 1000, overflow: TextOverflow.visible,),),]),
              const SizedBox(height: 10,),
              Row(
                  children: [
                    Padding(padding: const EdgeInsets.only(bottom: 22),
                      child: Text('.', style: headline1(black)),
                    ),
                    const SizedBox(width: 20,),
                    SizedBox(
                      width: size.width * 0.8,
                      child: Text('Select your choice, pay for it and we process it for you', 
                        style: body4(black, TextDecoration.none, ),
                        softWrap: true,
                        maxLines: 1000, overflow: TextOverflow.visible,),),]),
              const SizedBox(height: 30,),

              AppButton(textColor: white,onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => AutoInsureSettings(),),);}, label: "Proceed")
            ],
          ),
        ),
      ),
    );
  }
}