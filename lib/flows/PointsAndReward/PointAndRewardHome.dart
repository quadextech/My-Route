import 'package:flutter/material.dart';
import 'package:myroute/flows/registration/Reg_global_File/App_button.dart';

import '../../constants/app_color.dart';
import '../../constants/app_image.dart';
import '../../constants/textstyle.dart';
import '../registration/Reg_global_File/back_button.dart';
import 'MyRoutePoints.dart';

class PointAndRewardHome extends StatefulWidget {
  const PointAndRewardHome({Key? key}) : super(key: key);

  @override
  State<PointAndRewardHome> createState() => _PointAndRewardHomeState();
}

class _PointAndRewardHomeState extends State<PointAndRewardHome> {
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
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset(peoplepresent),
            Text('Introducing Points and Reward', style: headline2(black),),
            SizedBox(height: 15,),
            Row(
                children: [
                  Padding(padding: const EdgeInsets.only(bottom: 12),
                    child: Text('.', style: headline1(black)),
                  ),
                  const SizedBox(width: 20,),
                  SizedBox(
                    width: size.width * 0.85,
                    child: Text('Earn 100 points on every ride completed either as a driver or a passenger.',
                      style: body3(black, TextDecoration.none),
                      softWrap: true,
                      maxLines: 1000, overflow: TextOverflow.visible,),),]),
            SizedBox(height: 15,),
            Row(
                children: [
                  Padding(padding: const EdgeInsets.only(bottom: 12),
                    child: Text('.', style: headline1(black)),
                  ),
                  const SizedBox(width: 20,),
                  SizedBox(
                    width: size.width * 0.85,
                    child: Text('Exchange earned points for special benefits provided my MyRoute for you to enjoy!',
                      style: body3(black, TextDecoration.none),
                      softWrap: true,
                      maxLines: 1000, overflow: TextOverflow.visible,),),]),
            SizedBox(height: 30,),

            AppButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> MyRoutePoints()),);
                },
                label: 'Proceed'),

          ],

        ),
      ),
    );
  }
}