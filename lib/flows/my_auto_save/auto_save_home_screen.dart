import 'package:flutter/material.dart';
import 'package:myroute/flows/registration/Reg_global_File/App_button.dart';

import '../../constants/app_color.dart';
import '../../constants/app_image.dart';
import '../../constants/textstyle.dart';
import '../registration/Reg_global_File/back_button.dart';
import 'auto_save_parameters.dart';


class AutoSaveHome extends StatelessWidget {
  const AutoSaveHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        leading: AppBackButton(),
        centerTitle: true,
        title: Text('My AutoSave', style: body1(black, TextDecoration.none),),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
        children: [
          Center(child: Image.asset(piggynpeople)),
          SizedBox(height: 30,),
          Text('Introducing My AutoSave', style: headline1(black,),),
          SizedBox(height: 17,),
          Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 22),
                  child: Text('.', style: headline1(black)),
                ),
                const SizedBox(width: 20,),
                SizedBox(
                  width: size.width * 0.9,
                  child: Text('AutoSave allows you save up cash in advance for unexpected car faults, documents renewal and car servicing',
                    style: body4(black, TextDecoration.none),
                    softWrap: true, maxLines: 1000, overflow: TextOverflow.visible,),),]),
          SizedBox(height: 17,),
          Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 22),
                  child: Text('.', style: headline1(black)),
                ),
                const SizedBox(width: 20,),
                SizedBox(
                  width: size.width * 0.9,
                  child: Text('Dedicate an amount to save up monthly or weekly for your Car goals from your MyWallet, My CarEarn or your Debit card',
                    style: body4(black, TextDecoration.none),
                    softWrap: true, maxLines: 1000, overflow: TextOverflow.visible,),),]),
          SizedBox(height: 25,),
          AppButton(
              onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => const AutoSaveParemeters()));
              },
              label: 'Proceed'),

        ],
        ),
      ),
    );
  }
}