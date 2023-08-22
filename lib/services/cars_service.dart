import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
final carServiceProvider = Provider<CarService>((ref)=> CarService());
class CarService {
   verifyCarDetails(vehicleColor, vehicleYear, vehicleModel, vehicleManfac, plateNumber, referralCode) async {
        String message = 'Something went wrong';
    final url = Uri.parse('https://myroute-aqn5.onrender.com/api/v1/cars');
    final response = await http.post(
      url,
      body: {
        'vehicleColor': vehicleColor,
        'vehicleYear': vehicleYear,
        'vehicleModel': vehicleModel,
        'vehicleManfac':vehicleManfac,
        'plateNumber': plateNumber,
        'referralCode': referralCode,
      },
    );
    

    if (response.statusCode == 201) {
      message = "Registration Successful";
      final responseBody = json.encode(response.body);
      print(responseBody);
    } else {
      message = response.body;
      print('Request failed with status code: ${response.statusCode}');
      return message;

    }
  }
}