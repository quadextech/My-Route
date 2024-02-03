import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:myroute/Map/Myroutes/routes.dart';
import 'package:myroute/constants/app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Map/map_shared_prefs.dart';
import 'package:flutter_map/flutter_map.dart';
import 'Myroutes/getLocation.dart';
import 'mapbox_requests.dart';

import 'package:http/http.dart' as http;


class MyRouteMap extends ConsumerStatefulWidget {
  final AnimatedMapController animatedMapController;

  const MyRouteMap({super.key, required this.animatedMapController,});

  @override
  ConsumerState<MyRouteMap> createState() => _MyRouteMapState();
}

class _MyRouteMapState extends ConsumerState<MyRouteMap> with TickerProviderStateMixin{



late LatLng currentlatlng;
late LatLng desLatLng;
  late MapController mapController;
  List<Marker> markers = [];


late List<LatLng> polylineCoordinates;
late dynamic LatLngCoodinates;


  void marker(LatLng desLatLng, Widget Icon){
   final newLatLng = desLatLng;
   final newIcon = Icon;
    setState(() {
        markers.add(
        Marker(point: newLatLng, child: newIcon),);
    });
     }

     //Map<Polyline> polylines = {};


@override
  void initState() {
    // TODO: implement initState

    currentlatlng = getLatLngFromSharedPrefs();
mapController = MapController();
marker(currentlatlng, Icon(Icons.radio_button_checked));

  }




@override
  Widget build(BuildContext context) {
    final state = ref.watch(mapRequestsProvider);
     desLatLng = getdesLatLng();
     print("here >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $desLatLng");
     print(desLatLng.longitude);
     print(desLatLng.latitude);
   marker(desLatLng, Icon(Icons.location_on, color: primaryColor,));

      return Scaffold(
      body: FlutterMap(
        mapController:  widget.animatedMapController.mapController,
        options: MapOptions(
          initialCenter:  currentlatlng,
          maxZoom: 15,
          minZoom: 10,
        ), children: [
        TileLayer(
          urlTemplate: "https://api.mapbox.com/styles/v1/quadextech/clqpbbzst00r701qyd85z4h7d/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicXVhZGV4dGVjaCIsImEiOiJjbHFveW9wcGUzajcxMm5ta2puYmEwczR6In0.aEuEOGr7uMk_g-dEFAEL6g",
          additionalOptions: const {
            "accessToken": "pk.eyJ1IjoicXVhZGV4dGVjaCIsImEiOiJjbHFveW9wcGUzajcxMm5ta2puYmEwczR6In0.aEuEOGr7uMk_g-dEFAEL6g",
            "id": "mapbox.mapbox-streets-v8",
          },
        ),
        MarkerLayer(
            markers: markers),
        
        PolylineLayer(polylines: ref.read(mapRequestsProvider).polylines),

      ],

      ),
      floatingActionButton:  Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: () async {
            widget.animatedMapController.mapController.move(currentlatlng, 14);
            setState(() {
              marker(currentlatlng, const Icon(Icons.radio_button_checked,));
            });
          },
            child: const Icon(Icons.my_location),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FloatingActionButton(onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                      GetLocation(),

                  ));
            },
              child: const Icon(Icons.turn_sharp_left),
            ),
          ),
        ],
      )
    );
  }
}