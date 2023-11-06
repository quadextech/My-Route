import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myroute/constants/app_color.dart';
import 'package:myroute/constants/textstyle.dart';
import 'package:myroute/flows/registration/Reg_global_File/App_button.dart';
import 'package:myroute/flows/registration/Reg_global_File/back_button.dart';
import 'package:myroute/services/book_ride.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/app_image.dart';

class ShareRideDetails extends ConsumerWidget {
  final driverDetails;
  const ShareRideDetails({super.key, required this.driverDetails});

  @override
  Widget build(BuildContext context, ref) {
    final endTripRef = ref.watch(bookRideProvider);
    return Column(
      children: [
        Row(
          children: [
            const AppBackButton(),
            Text(
              'in transit',
              style: body4(grey3, TextDecoration.none),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'Your trip with Michael and ${driverDetails.seats} others has started\n,Enjoy!',
          style: body4(grey3, TextDecoration.none),
        ),
        const SizedBox(
          height: 15,
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(driverDetails.image),
          radius: 10,
        ),
        Row(
          children: [
            Text('${driverDetails.name}'),
          ],
        ),
        Text('${driverDetails.carName} ${driverDetails.plateNo}'),
        Row(
          children: [
            SvgPicture.asset(monie),
            Text('Fixed Price: ${driverDetails.price}')
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        AppButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              final userId = prefs.getString('id')!;
              final token = prefs.getString('token')!;
              endTripRef.endRide(
                  endTrip: 'endTrip',
                  userId: userId,
                  driverId: driverDetails.driverId,
                  token: token);
            },
            label: 'Share Ride Details',
            textColor: white),
        const SizedBox(
          height: 15,
        ),
        AppButton(onPressed: () {}, label: 'End trip', textColor: black),
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
          'Your pament for the trip is due, proceed to pay\n ${driverDetails.price}',
          style: body3(black, TextDecoration.none),
        ),

        SizedBox(height:20),
        AppButton(onPressed: (){}, label: 'Pay ${driverDetails.price} to ${driverDetails.name}', textColor: white)
      ],
    );
  }
}
