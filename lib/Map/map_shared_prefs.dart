import 'dart:convert';

import 'package:latlong2/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';


LatLng getLatLngFromSharedPrefs() {
  return LatLng(prefs.getDouble('latitude')!, prefs.getDouble('longitude')!);
}


String getMapmapBoxIdSharePrefs(){
  return prefs.getString('mapBoxId')! ?? '';
}

LatLng getdesLatLng(){
  return LatLng(prefs.getDouble("deslatitude") ?? 0, prefs.getDouble("deslongitude") ?? 0);
}

LatLng getdesRouteLatLng(){
  return LatLng(prefs.getDouble("deslatitude") ?? prefs.getDouble("latitude")!, prefs.getDouble("deslongitude") ?? prefs.getDouble('longitude')!);

}