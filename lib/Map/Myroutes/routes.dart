// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:myroute/Map/map_helpers.dart';
// import 'package:myroute/Map/map_shared_prefs.dart';
//
// import 'getLocation.dart';
//
// class Routes extends ConsumerStatefulWidget {
//   const Routes({super.key});
//
//   @override
//   ConsumerState<Routes> createState() => _RoutesState();
// }
//
// class _RoutesState extends ConsumerState<Routes> {
//
//   TextEditingController AtLocationController = TextEditingController();
//   TextEditingController whereYouGoingController = TextEditingController();
//
//
//
//   Future<void> drawPolylineFromOriginToDestination(bool darkTheme) async{
//     var currentPosition = getLatLngFromSharedPrefs();
//     var DestinationPosition = getdesLatLng();
//
//     showDialog(context: context,
//         builder: (BuildContext context) => CircularProgressIndicator(
//         ));
//
//
//
//
//   }
//
//
// //String name = '';
//
//   @override
//   void initState() {
//     // TODO: implement initState
//
//      // final LocationName = ref.read(mapHelpersProvider).getLocation(name);
//      // print(LocationName);
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final state = ref.watch(mapHelpersProvider);
//
//     return Scaffold(
//       body: Consumer(
//         builder: (_, ref, __) {
//           return Padding(
//             padding: const EdgeInsets.only(top: 50),
//             child: Column(
//               children: [
//                 TextFormField(
//                   decoration: InputDecoration(
//                     icon: Padding(
//                         padding: EdgeInsets.only(left: 20),
//                         child: Text("")),
//                     hintText: 'Search for location',
//                     contentPadding: EdgeInsets.only(left: 30),
//                     fillColor: Colors.white,
//                     focusColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide.none,
//                       borderRadius: BorderRadius.all(Radius.circular(30),
//                       ),
//                     ),),
//                   controller: AtLocationController,
//                   onTap: (){
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => GetLocation()));
//                   },
//                 ),
//
//                 TextFormField(
//                   decoration: InputDecoration(
//                     icon: Padding(
//                         padding: EdgeInsets.only(left: 20),
//                         child: Text(whereYouGoingController.text)),
//                     hintText: 'Search for location',
//                     contentPadding: EdgeInsets.only(left: 30),
//                     fillColor: Colors.white,
//                     focusColor: Colors.white,
//                     border: const OutlineInputBorder(
//                       borderSide: BorderSide.none,
//                       borderRadius: BorderRadius.all(Radius.circular(30),
//                       ),
//                     ),),
//                   controller: whereYouGoingController,
//                   onTap: (){
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => GetLocation()));
//                   },
//                 ),
//               ],
//             ),
//           );
//         }
//       ),
//
//     );
//   }
// }