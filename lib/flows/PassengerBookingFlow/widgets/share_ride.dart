import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myroute/constants/app_color.dart';
import 'package:myroute/constants/textstyle.dart';
import 'package:myroute/flows/registration/Reg_global_File/App_button.dart';
import 'package:myroute/flows/registration/Reg_global_File/back_button.dart';
import 'package:myroute/services/passengersRide.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/app_image.dart';

class ShareRideDetails extends ConsumerWidget {
  final driverDetails;
  const ShareRideDetails({super.key, required this.driverDetails});

  @override
  Widget build(BuildContext context, ref) {
    Size size = MediaQuery.of(context).size;
    final endTripRef = ref.watch(bookRideProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            const AppBackButton(),
            SizedBox(
              width: size.width*0.275,
            ),
            Text(
              'In transit',
              style: body4(grey3, TextDecoration.none),
            ),
          ],
        ),
        SizedBox(
          height: size.height*0.015,
        ),
        Text(
          //'Your trip with Michael and ${driverDetails.seats} others has started\n,Enjoy!',
          'Your trip with Michael and Isaac others has started',
          style: body4(grey3, TextDecoration.none),
        ),
        SizedBox(
          height: size.height*0.01,
        ),
        Text('Enjoy!', style: body4(grey3, TextDecoration.none)),
        const SizedBox(
          height: 15,
        ),
        CircleAvatar(
          //backgroundImage: NetworkImage(driverDetails.image),
          child: Icon(Icons.man),
          radius: 35,
        ),
        SizedBox(
          height: size.height*0.016,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Text('${driverDetails.name}'),
            Text('Joe', style: headline3(grey1)),
            Icon(Icons.star_border, color: Color(0xFFFF6900))
          ],
        ),

        SizedBox(height: size.width*0.03,),
        Text(' Camry . ${123455}', style: headline4(grey3),),
        //Text('${driverDetails.carName} ${driverDetails.plateNo}'),

        SizedBox(
          height: size.height*0.017,
        ),

        Text('MyRoute . Ikeja . Ikorodu way', style: headline4(grey3), ),

        SizedBox(
          height: size.height*0.017,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Image(image: AssetImage(
               money
           )),
            // Text('Fixed Price: ${driverDetails.price}')
            Text('Fixed Price: 1000000', style: headline3(grey1),)
          ],
        ),
        SizedBox(
          height: size.height*0.025,
        ),
        AppButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              final userId = prefs.getString('id')!;
              final token = prefs.getString('token')!;
              endTripRef.endRide(
                  userId: userId,
                  driverId: driverDetails.driverId,
                  token: token);
            },
            label: 'Share Ride Details',
            textColor: white),
        const SizedBox(
          height: 15,
        ),
        AppButton(onPressed: () {}, label: 'End trip', textColor: black, buttonColor: white,),
        const SizedBox(
          height: 15,
        ),
        TextButton(
          child: Text(
            'SOS',
            style: body3(errorColor, TextDecoration.none),
          ),
          onPressed: () {},
        ),
      ],
    );
  }




  Widget makePayment() {
    return Column(
      children: [
        Row(
          children: [
            const AppBackButton(),
            Text(
              'Trip Over',
              style: body4(grey3, TextDecoration.none),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        CircleAvatar(
          radius: 10,
          backgroundImage: NetworkImage(driverDetails.image),
        ),
        Text(
          'Your payment for the trip is due, proceed to pay\n ${driverDetails.price}',
          style: body3(black, TextDecoration.none),
        ),

        const SizedBox(height:20),
        AppButton(onPressed: (){}, label: 'Pay ${driverDetails.price} to ${driverDetails.name}', textColor: white)
      ],
    );
  }
}