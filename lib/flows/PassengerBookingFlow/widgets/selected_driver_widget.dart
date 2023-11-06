import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myroute/constants/app_color.dart';
import 'package:myroute/constants/app_image.dart';
import 'package:myroute/constants/textstyle.dart';
import 'package:myroute/flows/registration/Reg_global_File/globalfile.dart';

class SelectedDriver extends StatelessWidget {
  final driverDetails;
  const SelectedDriver({super.key, required this.driverDetails});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            const AppBackButton(),
            Text(
              '${driverDetails.name} Ride details',
              style: body4(grey3, TextDecoration.none),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        const CircleAvatar(
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
            const Icon(Icons.history),
            Text('${driverDetails.time}'),
            const Icon(
              Icons.person,
            ),
            Text('${driverDetails.seats} seats availale')
          ],
        ),
        Row(
          children: [
            SvgPicture.asset(monie),
            Text('Fixed Price: ${driverDetails.price}')
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: grey5,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.call,
                  color: black,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: grey5,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(message)),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(),
        Text(
          'Allowed Payment Methods',
          style: headline3(black),
        ),
        Row(
          children: [
            SvgPicture.asset(svgwallet),
            Text(
              driverDetails.payment,
              style: body3(grey4, TextDecoration.none),
            )
          ],
        ),
        const Divider(),
        Text(
          'Current Passengers',
          style: headline3(black),
        ),
        SizedBox(
          width: size.width,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: driverDetails.passengers,
              itemBuilder: (context, index) {
                final passenger = driverDetails.passengers[index];
                return Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(passenger.image),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(passenger.name,
                        style: body3(black, TextDecoration.none))
                  ],
                );
              }),
        ),
        Divider()
      ],
    );
  }
}
