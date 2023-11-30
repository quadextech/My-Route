import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myroute/constants/app_color.dart';
import 'package:myroute/constants/app_image.dart';
import 'package:myroute/constants/textstyle.dart';
import 'package:myroute/flows/PassengerBookingFlow/global_file/global_form_feild.dart';
import 'package:myroute/flows/registration/Reg_global_File/App_button.dart';
import 'package:myroute/flows/registration/Reg_global_File/back_button.dart';
import 'package:myroute/services/book_ride.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RateTrip extends ConsumerStatefulWidget {
  final driverDetails;
  const RateTrip({super.key, required this.driverDetails});

  @override
  ConsumerState<RateTrip> createState() => _RateTripState();
}

class _RateTripState extends ConsumerState<RateTrip> {
  bool isPressed1 = false;

  bool isPressed2 = false;

  bool isPressed3 = false;

  bool isPressed4 = false;

  bool isPressed5 = false;

  bool isLoading = false;
   bool isSuccess = false;

  int rating = 0;
  double space = 3;
  final reviewController = TextEditingController();


  void exit() {
    Navigator.pop(context);
  }

  void showSnack(message) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          'An error occured',
          textAlign: TextAlign.center,
        )));
  }

  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final rateRef = ref.watch(bookRideProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            const AppBackButton(),
            SizedBox(width: size.width*0.27,),
            Text(
              'Trip over',
              style: body4(grey3, TextDecoration.none),
            )
          ],
        ),
        SizedBox(
          height: size.height*0.025,
        ),
        isSuccess? reviewSaved(): Column(
          children: [
            CircleAvatar(
            //backgroundImage: NetworkImage(widget.driverDetails.image),
            child: Icon(Icons.man),
            radius: 35,
            ),

            SizedBox(
              height: size.height*0.025,
            ),
            //Text('Rate and review your trip with ${widget.driverDetails.name}'),
            Text('Rate and review your trip with Isaac', style: headline4(grey3)),
            SizedBox(
              height: size.height*0.01,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        isPressed1 = !isPressed1;
                        rating = 1;
                      });
                    },
                    icon: isPressed1
                        ? const Icon(Icons.star_border, color: Color(0xFFFF6900))
                        : Icon(Icons.star_border, color: grey4)),
                SizedBox(width: space),
                IconButton(
                    onPressed: () {
                      setState(() {
                        isPressed1 = true;
                        isPressed2 = !isPressed2;
                        rating = 2;
                      });
                    },
                    icon: isPressed2
                        ? const Icon(Icons.star_border, color: Color(0xFFFF6900))
                        : Icon(Icons.star_border, color: grey4)),
                SizedBox(width: space),
                IconButton(
                    onPressed: () {
                      setState(() {
                        isPressed1 = true;
                        isPressed2 = true;
                        isPressed3 = !isPressed3;
                        rating = 3;
                      });
                    },
                    icon: isPressed3
                        ? const Icon(Icons.star_border, color: Color(0xFFFF6900))
                        : Icon(Icons.star_border, color: grey4)),
                SizedBox(width: space),
                IconButton(
                    onPressed: () {
                      setState(() {
                        isPressed1 = true;
                        isPressed2 = true;
                        isPressed3 = true;
                        isPressed4 = !isPressed4;
                        rating = 4;
                      });
                    },
                    icon: isPressed4
                        ? const Icon(Icons.star_border, color: Color(0xFFFF6900))
                        : Icon(Icons.star_border, color: grey4)),
                SizedBox(width: space),
                IconButton(
                    onPressed: () {
                      setState(() {
                        isPressed1 = true;
                        isPressed2 = true;
                        isPressed3 = true;
                        isPressed4 = true;
                        isPressed5 = !isPressed5;
                        rating = 5;
                      });
                    },
                    icon: isPressed5
                        ? const Icon(Icons.star_border, color: Color(0xFFFF6900))
                        : Icon(Icons.star_border, color: grey4)),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            GlobaltextField(
                controller: reviewController,
                preficIcon: Text(''),
                label: 'Write a review'),
            SizedBox(
              height: 20,
            ),
            AppButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  final String id = prefs.getString('id')!;
                  final String token = prefs.getString('token')!;


                  print(rating.toString());
                  print(reviewController.text);

                  final message = await rateRef.rateRide(
                      passengerId: id,
                      driverId: widget.driverDetails,
                      ratings: rating.toString(),
                      reviews: reviewController.text,
                      token: token);
                  print(rating.toString());
                  print(reviewController.text);
                  print(token);

                  if (message == 'update successful') {
                    setState(() {
                      isLoading = false;
                      isSuccess = true;
                    });
                  //  reviewSaved();
                  } else {
                    setState(() {
                      isLoading = false;
                    });
                    showSnack(message);
                  }
                },
                label: 'Submit',
                textColor: white),
          ],
        )
      ],
    );
  }

  Widget reviewSaved() {
    return Column(
      children: [
        SvgPicture.asset(success),
        SizedBox(
          height: 10,
        ),
        Text(
          'Review saved successfully!',
          style: body2(successColor, TextDecoration.none),
        ),
        SizedBox(height: 30),
        AppButton(
            onPressed: () {
              exit();
            },
            label: 'Exit',
            textColor: white)
      ],
    );
  }
}