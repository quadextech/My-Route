import 'package:flutter/material.dart';
import 'package:myroute/flows/registration/Reg_global_File/globalfile.dart';

import '../../../constants/app_color.dart';
import '../../../constants/textstyle.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: AppBackButton(),
        centerTitle: true,
        title: Text('Transaction Details', style: body2(black, TextDecoration.none)),
      ), 
      
      
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      Row(children: [ Icon(Icons.arrow_forward_ios_outlined, color: successColor, size:15),  Text('  Withdrawal from MyCarEarn', style:body4(greenColor, TextDecoration.none))],),
      const SizedBox(height: 10,),
      Text('N 1,000.00', style: headline2(black),),
       const SizedBox(height: 10,),
      Row(
        
        children: [
          Text('January 1st 2023 •  ', style: body4(black, TextDecoration.none),),
          Text('12:00PM', style: body4(black, TextDecoration.none),),
        ],
      ),
      const SizedBox(height: 50,),
      
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('To', style: body3(black, TextDecoration.none),), Text('First Bank', style: headline4(black),), ],),
      const SizedBox(height: 10,),
      Divider(color:grey5, thickness:1),
      const SizedBox(  height: 20,),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Recipient', style: body3(black, TextDecoration.none),), Column( crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('Boluwatife Jennifer', style: headline4(black),),
          Text('1666777887')
        ],
      ), ],),
      const SizedBox(height: 10,),
      Divider(color:grey5, thickness:1),
      const SizedBox(  height: 10,),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,   children: [Text('Transaction Status', style: body3(black, TextDecoration.none),), Text('Processed', style: headline4(successColor),), ],),
      const SizedBox(height: 10,),
      Divider(color:grey5, thickness:1),
      const SizedBox(height: 10,),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,   children: [Text('Charges', style: body3(black, TextDecoration.none),), Text('N25', style: headline4(black),), ],),
      const SizedBox(height: 10,),
      Divider(color:grey5, thickness:1),
      const SizedBox(height: 10,),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,  children: [Text('Reference', style: body3(black, TextDecoration.none),), Text('YN668UIK', style: headline4(black),), ],),
      const SizedBox(height: 10,),
      Divider(color:grey5, thickness:1),
      const SizedBox(height: 10,),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,  children: [Text('New Balance', style: body3(black, TextDecoration.none),), Text('5,000.00', style: headline4(black),), ],),
 const SizedBox(height: 60,),

AppButton(onPressed: (){}, label: 'Download Summary',textColor: white,)        ],),
      )   );
  }
}