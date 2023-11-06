import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myroute/flows/PassengerBookingFlow/global_file/global_file.dart';
import 'package:myroute/flows/PointsAndReward/PointAndRewardHome.dart';
import 'package:myroute/flows/my_auto_doc/autodoc_home.dart';
import 'package:myroute/flows/my_autoinsure/autoinsure_homepage.dart';
import 'package:myroute/flows/my_carEarn/my_carEarnHome.dart';
import 'package:myroute/flows/registration/Car_Registration/views/car_details_reg.dart';
import '../../../../../constants/app_color.dart';
import '../../../../../constants/app_image.dart';
import '../../../../../constants/textstyle.dart';
import '../../../../../services/user_authentication.dart';
import '../../../../my wallet/views/mywallet.dart';
import '../../../../my_auto_save/auto_save_home_screen.dart';
import '../../../../registration/login/views/login_sreen.dart';
import '../../../../registration/ninRegistration.dart';
import '../../SearchingAvailableRide/SearchavailableRide_method.dart';

class DriverHome extends StatefulWidget {
  final String name;
  const DriverHome({super.key, required this.name});

  @override
  State<DriverHome> createState() => _DriverHomeState();
}

class _DriverHomeState extends State<DriverHome> {
  TextEditingController whereEditingController = TextEditingController();
  TextEditingController goingToEditingController = TextEditingController();
  TextEditingController whenEditingController = TextEditingController();
  TextEditingController howManyEditingController = TextEditingController();

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
      drawer:  AppDrawer(name: widget.name),
      body: Stack(children: [
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
      ]),
    );
  }
}

class AppDrawer extends ConsumerWidget {
  final String name;
  const AppDrawer( {required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final logoutRef = ref.watch(userAuthProvider);
    return Drawer(
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
                      Container(
                        child: Icon(Icons.supervised_user_circle),
                        decoration: BoxDecoration(
                          color: grey5,
                          borderRadius: BorderRadius.circular(30),
                        )
                      ),
                      Positioned(
                        bottom: 0,
                        right: 10,
                        child: GestureDetector(
                          onTap: () {},
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
                              child: const Icon(
                                Icons.edit,
                                size: 15,
                              )),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 45.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name, style: headline4(white)),
                        const SizedBox(height: 7),
                        Text(
                          'Point score: 500',
                          style: body4(successColor, TextDecoration.none),
                        ),
                        const SizedBox(height: 7),
                        GestureDetector(
                            onTap: () {},
                            child: Text('Edit profile',
                                style: body4(white, TextDecoration.underline)))
                      ],
                    ),
                  )
                ],
              )),
          ListTile(
            leading: SvgPicture.asset(svgwallet),
            title: const Text('MyWallet'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyWalletScreen()));
            },
          ),
          ListTile(
            leading: SvgPicture.asset(mdicarsports, color: black),
            title: const Text('My CarRegistration'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CarDetailsReg()));
            },
          ),
          ListTile(
            leading: SvgPicture.asset(license, color: black),
            title: const Text('NINRegistration'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NinRegistration()));
            },
          ),
          ListTile(
            leading: SvgPicture.asset(svgmyAutoDoc),
            title: const Text('My AutoDoc'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AutoDocHome()));
            },
          ),
          ListTile(
            leading: SvgPicture.asset(svgAutosave),
            title: const Text('My AutoSave'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AutoSaveHome()));
            },
          ),
          ListTile(
            leading: SvgPicture.asset(svgautoinsure),
            title: const Text('My AutoInsure'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AutoInsureHome()));
            },
          ),
          ListTile(
            leading: SvgPicture.asset(svgnaira),
            title: const Text('My CarEarn'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyCarEarnHome()));
            },
          ),
          ListTile(
            leading: SvgPicture.asset(svgPointsandreward, color: black),
            title: const Text('Points and Reward'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PointAndRewardHome()));
            },
          ),
          Container(
            color: grey5,
            height: 5,
          ),
          ListTile(
            leading: SvgPicture.asset(svglogout),
            title: const Text('Log out'),
            onTap: () async {
              await logoutRef.logout();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
    );
  }
}