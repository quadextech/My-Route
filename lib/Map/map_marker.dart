import 'package:flutter/cupertino.dart';
import 'package:latlong2/latlong.dart';

class Marker{
  final double width;
 final double height;
  late final LatLng point;
      late final Widget child;
      Marker({required this.point, required this.child, this.height = 80, this.width = 80});
}