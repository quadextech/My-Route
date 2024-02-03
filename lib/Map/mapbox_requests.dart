import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'map_shared_prefs.dart';


String accessToken = "pk.eyJ1IjoicXVhZGV4dGVjaCIsImEiOiJjbHFveW9wcGUzajcxMm5ta2puYmEwczR6In0.aEuEOGr7uMk_g-dEFAEL6g";

final mapRequestsProvider = ChangeNotifierProvider((ref) => MapRequests());



class MapRequests extends ChangeNotifier{


 LatLng currentLatLng = getLatLngFromSharedPrefs();
 LatLng desLatLng = getdesLatLng();
 List<Polyline> polylines = [];





 Future<Polyline> generatePolyLineFromPoints(LatLngCoodinates) async{
   print("================================================$LatLngCoodinates");
     Polyline polyline = Polyline(
         color: Colors.black,
         strokeWidth: 8,
         points: LatLngCoodinates);
   polylines.add(polyline);
   print('Added');
   return polyline;
   }


  Future<List<LatLng>> getDrivingRoute(LatLng currentLatLng, LatLng desLatLng) async{
    String baseUrl = "https://api.mapbox.com/directions/v5/mapbox";
    String navType = "driving";
    final url = Uri.parse("$baseUrl/$navType/${currentLatLng.longitude},${currentLatLng.latitude};${desLatLng.longitude},${desLatLng.latitude}?alternatives=true&geometries=geojson&language=en&overview=full&steps=true&access_token=$accessToken");
   final response = await http.get(
     url,
     headers: {
       'Content-Type': 'application/json',
     });

        final responseData = json.decode(response.body);
        List<dynamic> coordinates1 = responseData['routes'][0]['geometry']['coordinates'];
        List<LatLng> LatLngCoodinates = [];
        coordinates1.forEach((element) {
          LatLng LatLngCoord = LatLng(element[0], element[1]);
          LatLngCoodinates.add(LatLngCoord);
        });
        //print(LatLngCoodinates);



    //List<dynamic> coordinates2 = responseData['routes'][1]['geometry']['coordinates'];

    //print("???????????????????????? $coordinates1");
   // print("~~~~~~~~~~~~~~~~~~~ $coordinates2");
    notifyListeners();

        return LatLngCoodinates;
  }








  Future<LatLng> SearchedLocationName(mapBoxId) async {
   String session_token = '';
    String baseUrl = 'https://api.mapbox.com/search/searchbox/v1/retrieve';
    final url = Uri.parse('$baseUrl/$mapBoxId?session_token=$session_token&access_token=$accessToken');
    final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        });
        final responseData = json.decode(response.body);
      // print(responseData);
    final coordinates = responseData['features'][0]['geometry']['coordinates'];

    var latitude = coordinates[1];
    var longitude = coordinates[0];

    final searchedLocationLatLng = LatLng(latitude, longitude);

   SharedPreferences prefs = await SharedPreferences.getInstance();
  latitude =  prefs.setDouble("deslatitude", latitude!);
   longitude = prefs.setDouble("deslongitude", longitude!);





   notifyListeners();
   return searchedLocationLatLng;

  }




  List suggestions = [];

  Future<List> SuggestLocationName(String suggestName) async{
    String baseUrl = "https://api.mapbox.com/search/searchbox/v1/suggest?q=";
    String session_token = '';

    final url = Uri.parse("$baseUrl{$suggestName}&language=en&session_token=$session_token&access_token=$accessToken");
    final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        });
        final responseData = json.decode(response.body);

        suggestions = responseData['suggestions'];

      notifyListeners();

      return suggestions;
  }


}