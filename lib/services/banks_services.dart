import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
final BankServiceProvider = Provider<BankService>((ref)=> BankService());
class BankService {
  verifyBankDetails(address, accountName, accountNumber, bankName) async {
    String message = 'Something went wrong';
    final url = Uri.parse('https://myroute-aqn5.onrender.com/api/v1/cars');
    final response = await http.post(
      url,
      body: {
        'address': address,
        'accountName': accountName,
        'accountNumber': accountNumber,
        'bankName': bankName,
      },
    );

    if (response.statusCode == 201) {
      message = "Bank details added Successfully";
      final responseBody = json.encode(response.body);
      print(responseBody);
    } else {
      message = response.body;
      print('Request failed with status code: ${response.statusCode}');
      return message;

    }
  }
}