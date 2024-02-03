import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_image.dart';
import '../../global_file/swicher.dart';
import '../BookRideHomePage/model/homepageUI.dart';
import 'SearchavailableRide_method.dart';

class SearchingRide extends ConsumerStatefulWidget {
  const SearchingRide({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchingRide> createState() => _SearchingRideState();
}

class _SearchingRideState extends ConsumerState<SearchingRide> {

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
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const PassengerHomeScreen(name: ''),
              //     ));
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
          ],
        ));
  }
}