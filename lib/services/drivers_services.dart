import 'dart:convert';
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
      String bankaccountnumber,
      String bankname,
      String vehicleColor) async {
    
    String message = 'Something went wrong';
    final url = Uri.parse('https://myroute-aqn5.onrender.com/api/v1/drivers');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: {
       "user_Id": userId,
  "referral_Code": referralCode,
  "vehicle_Manufacturer": vehicleManufacturer,
  "vehicle_Model": vehicleModel,
  "vehicle_year": vehicleyear,
  "plate_number_license": platenumberlicense,
  "driver_license_number": driverlicensenumber,
  "driver_license": driverlicense,
  "driver_license_expiry_Date": driverlicenseexpiryDate,
  "outSide_Car_Photo": outSideCarPhoto,
  "inSide_Car_Photo": inSideCarPhoto,
  "address": address,
  "bank_account_holder_name": bankaccountholdername,
  "bank_account_number": bankaccountnumber,
  "bank_name": bankname,
  "vehicle_color": vehicleColor
      },
    );
    if (response.statusCode == 201) {
      message = "successful";
      final responseBody = json.encode(response.body);
      print(responseBody);
    } else {
      message = response.body;
      print('Request failed with status code: ${response.statusCode}');
      return message;

    } 
  }
}
