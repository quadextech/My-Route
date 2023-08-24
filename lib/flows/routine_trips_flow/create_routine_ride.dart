import 'package:flutter/material.dart';
import 'package:myroute/constants/app_color.dart';
import 'package:myroute/constants/app_image.dart';
import 'package:myroute/constants/textstyle.dart';
import 'package:myroute/flows/registration/Reg_global_File/App_button.dart';
import 'package:myroute/flows/registration/Reg_global_File/back_button.dart';

class CreateRoutineRideScreen extends StatefulWidget {
  const CreateRoutineRideScreen({super.key});

  @override
  State<CreateRoutineRideScreen> createState() =>
      _CreateRoutineRideScreenState();
}

class _CreateRoutineRideScreenState extends State<CreateRoutineRideScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: AppBackButton(),
        centerTitle: true,
        title: Text(
          'Routine Ride',
          style: body1(black, TextDecoration.none),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Image.asset(routine),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Introducing MyRoutine trips',
                style: headline2(black),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  '•',
                  style: body3(black, TextDecoration.none),
                ),
                SizedBox(
                  width: size.width * 0.85,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      ' These are trips you take regularly through the week either a a passenger,driver or both!',
                      style: body3(black, TextDecoration.none),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              '• Add as many routine trips as you like.',
              style: body3(black,TextDecoration.none),
            ),
            const SizedBox(height: 7),
            Row(
              children: [
                Text(
                  '•',
                  style: body3(black,TextDecoration.none),
                ),
                SizedBox(
                  width: size.width * 0.85,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      'This will help MyRoute quickly match you with a ride request or booking.',
                      style: body3(black,TextDecoration.none),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              '• Try it out now',
              style: body3(black,TextDecoration.none),
            ),
            const SizedBox(height: 70),
            AppButton(textColor: white,onPressed: () {}, label: 'Create Routine Ride')
          ],
        ),
      ),
    );
  }
}