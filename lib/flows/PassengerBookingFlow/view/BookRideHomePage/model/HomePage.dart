import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myroute/flows/PassengerBookingFlow/global_file/global_file.dart';
import '../../../../../constants/app_color.dart';
import '../../../../../constants/app_image.dart';
import '../../../../../constants/textstyle.dart';
import '../../SearchingAvailableRide/SearchavailableRide_method.dart';

class PassengerHome extends StatefulWidget {
  const PassengerHome({super.key});

  @override
  State<PassengerHome> createState() => _PassengerHomeState();
}

class _PassengerHomeState extends State<PassengerHome> {
  TextEditingController whereEditingController = TextEditingController();
  TextEditingController goingToEditingController = TextEditingController();
  TextEditingController whenEditingController = TextEditingController();
  TextEditingController howManyEditingController = TextEditingController();

  double _dragSheetExtent = 0.0;

double? contentHeight;

@override
void didChangeDependencies() {
  // TODO: implement initState
  super.didChangeDependencies();
  Future.delayed(Duration(seconds: 6), () {

    showModalBottomSheet(
      context: context,
      builder: (context) => CustomPopUpContainer(
        height: MediaQuery.of(context).size.height * 0.45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(child: Icon(
              Icons.horizontal_rule, size: 70, color: grey,

            )),
            SizedBox(
              height: 7,
            ),

            Column(
              children: [
                GlobaltextField(
                  keyboardType: TextInputType.none,
                  u: true,
                  controller: whereEditingController,
                  preficIcon: const Icon(Icons.radio_button_checked),
                  label: "Where are you leaving From",
                ),
                const SizedBox(height: 20),
                GlobaltextField(
                  keyboardType: TextInputType.none,
                  u: true,
                  controller: goingToEditingController,
                  preficIcon: const Icon(
                    Icons.location_on,
                    color: Colors.green,
                  ),
                  label: "Where are you going to?",
                ),
                const SizedBox(height: 20),

                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: GlobaltextField(
                        keyboardType: TextInputType.none,
                        u: true,
                        controller: whenEditingController,
                        preficIcon: const Icon(Icons.calendar_month),
                        label: "When are you going",
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: GlobaltextField(
                        keyboardType: TextInputType.none,
                        u: true,
                        controller: howManyEditingController,
                        preficIcon: const Icon(Icons.person),
                        label: "How many Seats?",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                )

              ],
            )
          ],
        ),
      ),
      isScrollControlled: true,

    );
  },
  );
}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        centerTitle: true,
        title: const Swicher(),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
                backgroundColor: white,
                radius: 20,
                child: Icon(
                  Icons.notifications,
                  color: black,
                  size: 15,
                )),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: black,
              ),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: grey,
                          radius: 30,
                          backgroundImage: Image.asset(userIcon).image,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 10,
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: primaryColor,
                                  ),
                                  shape: BoxShape.circle,
                                  color: white,
                                ),
                                child: const Icon(Icons.edit,  size: 15,)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Jennifer Boluwatife', style: headline1(white)),
                        Text('Point score: 500', style: body3(primaryColor, TextDecoration.none),),
                        TextButton(onPressed: (){}, child: Text('Edit profile', style: body3(white, TextDecoration.underline),))
                      ],
                    )
                  ],
                )),
            ListTile(
              leading: SvgPicture.asset(svgwallet),
              title: Text('MyWallet'),
              onTap: (){

              },
            ),
            ListTile(
              leading: SvgPicture.asset(mdicarsports),
              title: Text('My CarRegistration'),
              onTap: (){

              },
            ),
            ListTile(
              leading: SvgPicture.asset(svgmyAutoDoc),
              title: Text('My AutoDoc'),
              onTap: (){

              },
            ),
            ListTile(
              leading: SvgPicture.asset(svgAutosave),
              title: Text('My AutoSave'),
              onTap: (){

              },
            ),
            ListTile(
              leading: SvgPicture.asset(svgautoinsure),
              title: Text('My AutoInsure'),
              onTap: (){

              },
            ),
            ListTile(
              leading: SvgPicture.asset(svgnaira),
              title: Text('My CarEarn'),
              onTap: (){

              },
            ),
            ListTile(
              leading: SvgPicture.asset(svgPointsandreward),
              title: Text('Points and Reward'),
              onTap: (){

              },
            ),

            Container(
              color: grey,
              height: 5,
            ),

            ListTile(
              leading: SvgPicture.asset(svglogout),
              title: Text('Log out'),
              onTap: (){

              },
            ),

          ],
        ),
      ),
      body: Stack(
        children: [
        Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  city,
                ),
                fit: BoxFit.fill,
              )),
            ),
          
    ]
      ),

    );
  }
}