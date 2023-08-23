import 'package:flutter/material.dart';
import 'package:myroute/flows/trips_history/models/tripsHistory_pack.dart';
import '../../constants/app_color.dart';
import '../../constants/textstyle.dart';
import '../PassengerBookingFlow/view/select_car_preferences/models/BorderButton.dart';
import 'models/navigationitems.dart';

class TripHistory extends StatefulWidget {
  const TripHistory({Key? key}) : super(key: key);

  @override
  State<TripHistory> createState() => _TripHistoryState();
}

class _TripHistoryState extends State<TripHistory> {
  List TripsPages = [
    Package(),
    Text('dan'),
    Text('girl'),
  ];

  List<dynamic> color = [
    Colors.green,
    Colors.yellow,
    Colors.black,
  ];

  List<String> textName = [
    'Completed',
    'Pending',
    'Scheduled',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 1,
        title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 75),
            child: Text(
              'My Rides',
              style: body1(
                black,TextDecoration.none
              ),
            )),
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BorderButton(
            backgroundColor: white,
            color: black,
            onTap: () {
              Navigator.of(context).pop();
            },
            Icons: Icons.arrow_back,
            size: 20,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Material(
           elevation: 1,
           child: Container(
             height: 60,
             child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: List.generate(TripsPages.length, (index) {
                   return GestureDetector(
                     onTap: (){
                       _currentIndex = index;
                     },
                     child: Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 5.0),
                       child: MyRidesContainer(
                         textName: textName[index],
                           color: _currentIndex == index
                               ? color[index]
                               : null,
                         textColor: _currentIndex == index ? white : hintColor,
                       ),
                     ),
                   );
                 })),
           ),
         ),
         SizedBox(
           height: 25,
         ),
         Padding(
             padding: EdgeInsets.symmetric(horizontal: 10),
             child: Text('This month', style: body3(black, TextDecoration.none),)),

         SizedBox(
           height: 10,
         ),

         Padding(
           padding: EdgeInsets.symmetric(horizontal: 10),
           child: ConstrainedBox(
             constraints: BoxConstraints(maxHeight: size.height * 0.6),
             child: Stack(children: [
               PageView.builder(
                   itemCount: TripsPages.length,
                   onPageChanged: (index) {
                     setState(() {
                       _currentIndex = index;
                     });
                   },
                   itemBuilder: (context, index) {
                     return TripsPages[index];

                   }),
             ]),
           ),
         ),
       ],
      ),
    );
  }
}