import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final bookRideProvider = Provider<PassengersRide>((ref) => PassengersRide());

class PassengersRide {


  Future<String> GetPassengerRideDetails(String token) async{
    String message = "Something went wrong ";
    final url = Uri.parse('https://myroute-aqn5.onrender.com/api/v1/passengers/ride-details');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    if(response.statusCode == 200){

      var responseData = json.decode(response.body);
      final token = responseData['token'];
      final id = responseData['data']['user']['_id'];
      final pickupLocation = responseData['message']['user']['pickupLocation'];
      final dropOffLocation = responseData['data']['user']['dropOffLocation'];
      final whenAreyouGoing = responseData['data']['user']['whenAreyouGoing'];
      final seatsAvailable = responseData['data']['user']['seatsAvailable'];
      final currentMapLocation =
      responseData['data']['user']['currentMapLocation'];
      final whereAreyouGoing = responseData['data']['user']['whereAreyouGoing'];
      final whatRouteAreYouPassing =
      responseData['data']['user']['whatRouteAreYouPassing'];
      final whatTimeAreYouGoing =
      responseData['data']['user']['whatTimeAreYouGoing'];
      final price = responseData['data']['user']['price'];
      final paymentMethod = responseData['data']['user']['paymentMethod'];

      if (token != null && id != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);
        prefs.setString('id', id);
        prefs.setString('pickupLocation', pickupLocation);
        prefs.setString('dropOffLocation', dropOffLocation);
        prefs.setString('whenAreyouGoing', whenAreyouGoing);
        prefs.setString('seatsAvailable', seatsAvailable);
        prefs.setString('currentMapLocation', currentMapLocation);
        prefs.setString('whereAreyouGoing', whereAreyouGoing);
        prefs.setString('currentMapLocation', currentMapLocation);
        prefs.setString('whatRouteAreYouPassing', whatRouteAreYouPassing);
        prefs.setString('whatTimeAreYouGoing', whatTimeAreYouGoing);
        prefs.setString('price', price);
        prefs.setString('paymentMethod', paymentMethod);
        message = 'Driver search successful';
      }
    }
    return message;
  }



  Future<List<String>> getAllPassengers(String token) async{
    String message = "Something went wrong ";
    final url = Uri.parse('https://myroute-aqn5.onrender.com/api/v1/passengers/passenger');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    if(response.statusCode == 200){
      final jsonResponse = json.decode(response.body);
      List<String> messageList = List<String>.from(jsonResponse['message']);
      return messageList;
    }
    else {
      final jsonResponse = json.decode(response.body);
      final message = jsonResponse['message'];
      throw Exception(
          'Request failed with status: ${response.statusCode}, Message: $message');
    }
  }


  Future<String> getDriver(String token) async {
    String message = 'Something went wrong';
    final url = Uri.parse(
        'https://myroute-aqn5.onrender.com/api/v1/drivers/get-driver/personal-id');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      final token = responseData['token'];
      final id = responseData['data']['user']['_id'];
      final pickupLocation = responseData['message']['user']['pickupLocation'];
      final dropOffLocation = responseData['data']['user']['dropOffLocation'];
      final whenAreyouGoing = responseData['data']['user']['whenAreyouGoing'];
      final seatsAvailable = responseData['data']['user']['seatsAvailable'];
      final currentMapLocation =
          responseData['data']['user']['currentMapLocation'];
      final whereAreyouGoing = responseData['data']['user']['whereAreyouGoing'];
      final whatRouteAreYouPassing =
          responseData['data']['user']['whatRouteAreYouPassing'];
      final whatTimeAreYouGoing =
          responseData['data']['user']['whatTimeAreYouGoing'];
      final price = responseData['data']['user']['price'];
      final paymentMethod = responseData['data']['user']['paymentMethod'];

      if (token != null && id != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);
        prefs.setString('id', id);
        prefs.setString('pickupLocation', pickupLocation);
        prefs.setString('dropOffLocation', dropOffLocation);
        prefs.setString('whenAreyouGoing', whenAreyouGoing);
        prefs.setString('seatsAvailable', seatsAvailable);
        prefs.setString('currentMapLocation', currentMapLocation);
        prefs.setString('whereAreyouGoing', whereAreyouGoing);
        prefs.setString('currentMapLocation', currentMapLocation);
        prefs.setString('whatRouteAreYouPassing', whatRouteAreYouPassing);
        prefs.setString('whatTimeAreYouGoing', whatTimeAreYouGoing);
        prefs.setString('price', price);
        prefs.setString('paymentMethod', paymentMethod);
        message = 'Driver search successful';
      }
    }
    return message;
  }

  Future<List<String>> passengerSearchRide(
      String whereAreYouGoing, String currentMapLocation,
  String whenAreYouGoing, String bookedSeats, String preferredRoute,
      String whatTimeAreYouGoing, String token) async {
    final url = Uri.parse(
        'https://myroute-aqn5.onrender.com/api/v1/passengers/search-ride');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });

   if (response.statusCode == 200) {
  final jsonResponse = json.decode(response.body);
  List<String> messageList = List<String>.from(jsonResponse['message']);
  return messageList;
}
else {
      final jsonResponse = json.decode(response.body);
      final message = jsonResponse['message'];
      throw Exception(
          'Request failed with status: ${response.statusCode}, Message: $message');
    }
  }


  Future<String> rateRide({
    required String passengerId,
    required String driverId,
    required String ratings,
    required String reviews,
    required String token,
  }) async {

    String message = 'Something went wrong';

    final url = Uri.parse(
        'https://myroute-aqn5.onrender.com/api/v1/passengers/rate-ride/:$passengerId');
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode({
          "passengerId": passengerId,
          "driverId": driverId,
          "ratings": ratings,
          "reviews": reviews,
          "example": ''
        }));

    if (response.statusCode == 201) {
      message = 'update successful';
    } else {
      final jsonResponse = json.decode(response.body);
      message = jsonResponse["message"];
      return message;
    }
    return message;
  }

  Future<String> endRide(
      {
        required String userId,
        required String driverId,
        required String token}) async {
    String message = 'Something went wrong';
    final url = Uri.parse(
        'https://myroute-aqn5.onrender.com/api/v1/passengers/end-trip/:$userId');
    final response = await http.patch(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode({
          {
            "userId": userId,
            "driverId": driverId,
            "example": ''
          }
        }));
    if (response.statusCode == 201) {
      message = 'Ride end successful';
    } else {
      final jsonResponse = json.decode(response.body);
      message = jsonResponse["message"];
      return message;
    }
    return message;
  }

}