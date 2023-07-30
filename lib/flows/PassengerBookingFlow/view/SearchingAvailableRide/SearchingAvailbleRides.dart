import 'package:flutter/material.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_image.dart';
import '../../global_file/swicher.dart';
import '../BookRideHomePage/model/homepageUI.dart';
import 'SearchavailableRide_method.dart';

class SearchingRide extends StatefulWidget {
  const SearchingRide({Key? key}) : super(key: key);

  @override
  State<SearchingRide> createState() => _SearchingRideState();
}

class _SearchingRideState extends State<SearchingRide> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(
      Duration(seconds: 6),
      () {
        showModalBottomSheet(
          context: context,
          builder: (context) => CustomPopUpContainer(
            height: 60,
            child: Text('BOY'),
          ),
          isDismissible: false,
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
          centerTitle: true,
          title: const Swicher(),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PassengerHomeScreen(),
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                  backgroundColor: white,
                  radius: 20,
                  child: Icon(
                    Icons.menu,
                    color: black,
                    size: 15,
                  )),
            ),
          ),
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
        body: Column(
          children: [
            Container(
              height: size.height * 0.94,
              width: size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  city,
                ),
                fit: BoxFit.fill,
              )),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: size.width,
                height: size.height * 0.4,
                child: TextButton(
                  onPressed: () {
                    didChangeDependencies();
                  },
                  child: Icon(
                    Icons.horizontal_rule,
                    size: 30,
                    color: grey1,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
