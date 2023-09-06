import 'dart:convert';
import 'dart:ffi';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final driverServiceProvider = Provider<DriverService>((ref) => DriverService());

class DriverService {
  uploadFiles(
      String userId,
      String referralCode,
      String vehicleManufacturer,
      String vehicleModel,
      String vehicleyear,
      String platenumberlicense,
      String driverlicensenumber,
      String driverlicense,
      String driverlicenseexpiryDate,
      String outSideCarPhoto,
      String inSideCarPhoto,
      String address,
      String bankaccountholdername,
      bankaccountnumber,
      String bankname,
      String vehicleColor) async {
    
    String message = 'Something went wrong';
    final url = Uri.parse('https://myroute-aqn5.onrender.com/api/v1/drivers');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        {
          "userId": userId,
          "referralCode": referralCode,
          "vehicleManufacturer": vehicleManufacturer,
          "vehicleModel": vehicleModel,
          "vehicleYear": vehicleyear,
          "plateNumberLicense": platenumberlicense,
          "driverLicenseNumber": driverlicensenumber,
          "driverLicense": driverlicense,
          "driverLicenseExpiryDate": driverlicenseexpiryDate,
          "outSideCarPhoto": outSideCarPhoto,
          "inSideCarPhoto": inSideCarPhoto,
          "address": address,
          "bankAccountHolderName": bankaccountholdername,
          "bankAccountNumber": bankaccountnumber,
          "bankName": bankname,
          "vehicleColor": vehicleColor
        },
      ));
    if (response.statusCode == 201) {
      message = "successful";
      final responseBody = json.encode(response.body);
      print(responseBody);
    } else {
      message = response.body;
      print('Request failed with status code: ${response.statusCode}');
      print(response.body);
      return message;

    } 
  }
}