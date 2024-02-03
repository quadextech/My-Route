import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final DriverRideProvider = Provider<DriverRide>((ref) => DriverRide());

class DriverRide{
  Future<String> getDriverProfile(String token) async{
    String message = "Something went wrong";
    final url = Uri.parse('https://myroute-aqn5.onrender.com/api/v1/drivers/profile');
    final response = await http.get(url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      message = "Gotten";
    } else {
      final jsonResponse = json.decode(response.body);
      message = jsonResponse["message"];
      return message;
    }
    return message;


  }



  Future<String> driverStartTrip(
  String whenAreYouGoing,
 String whatRouteAreYouGoing,
      String dropOffLocation,
      String whereAreyouGoing,
      String seatsAvailable,
      String currentMapLocation,
      String destination,
      String whatRouteAreYouPassing,
      String whatTimeAreYouGoing,
      String price,
      String token) async {
    String message = 'Something went wrong';
    final url = Uri.parse(
        'https://myroute-aqn5.onrender.com/api/v1/drivers/start-trip');
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode({

          "dropOffLocation": dropOffLocation,
        "whenAreYouGoing": whenAreYouGoing,
          "whereAreyouGoing": whereAreyouGoing,
          "seatsAvailable": seatsAvailable,
          "currentMapLocation": currentMapLocation,
          "destination": destination,
          "whatRouteAreYouGoing": whatRouteAreYouGoing,
          "whatTimeAreYouGoing": whatTimeAreYouGoing,
          "price": price,

        }));

    if (response.statusCode == 200) {
      message = "Ride Started";
    } else {
      final jsonResponse = json.decode(response.body);
      message = jsonResponse["message"];
      return message;
    }
    return message;
  }


  Future<String> driverEndTrip(String token) async {
    String message = 'Something went wrong';
    final url = Uri.parse(
        'https://myroute-aqn5.onrender.com/api/v1/drivers/end-trip');
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
          //'token':token
        },);

    if (response.statusCode == 200) {
      message = "Ride Ended";
    } else {
      final jsonResponse = json.decode(response.body);
      message = jsonResponse["message"];
      return message;
    }
    return message;
  }

  Future<String> driverRateTrip(String token, driversId, rating, review) async {
    String message = 'Something went wrong';
    final url = Uri.parse(
        'https://myroute-aqn5.onrender.com/api/v1/drivers/ratings');
    final response = await http.post(url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
        //'token':token
      },
        body: jsonEncode({
          "userid": driversId,
          "rating": rating,
          "review": review
        }));

    if (response.statusCode == 200) {
      return message = "Successful";

    } else {
      final jsonResponse = json.decode(response.body);
      message = jsonResponse["message"];
      return message;
    }

  }

}