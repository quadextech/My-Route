import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final bookRideProvider = Provider<BookRide>((ref) => BookRide());

class BookRide {
  driverCreateRide(
     String userId,
     String pickupLocation,
     String dropOffLocation,
    String  whereAreyouGoing,
    String  seatsAvailable,
    String  currentMapLocation,
    String  destination,
    String  whatRouteAreYouPassing,
    String  whatTimeAreYouGoing,
    String  price,
    String  paymentMethod,
    String  example) async {
    String message = 'Something went wrong';
    final url = Uri.parse(
        'https://myroute-aqn5.onrender.com/api/v1/drivers/save-booking');
    final response = await http.post(url,   headers: {
        'Content-Type': 'application/json',
      }, body: jsonEncode({
      "userId": userId,
      "pickupLocation": pickupLocation,
      "dropOffLocation": dropOffLocation,
      "whereAreyouGoing": whereAreyouGoing,
      "seatsAvailable": seatsAvailable,
      "currentMapLocation": currentMapLocation,
      "destination": destination,
      "whatRouteAreYouPassing": whatRouteAreYouPassing,
      "whatTimeAreYouGoing": whatTimeAreYouGoing,
      "price": price,
      "paymentMethod": paymentMethod,
      "example": example
    }));

    if (response.statusCode == 200) {
      message = "Ride created";
    } else {
      final jsonResponse = json.decode(response.body);
   message = jsonResponse["message"];
      return message;
    }
  }
}
