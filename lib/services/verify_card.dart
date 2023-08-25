import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
final cardVerificationProvider = Provider<AddPayment>((ref)=> AddPayment());
class AddPayment {
   verifyCardDetails(cardNumber, expirationDate, cvv) async {
        String message = 'Something went wrong';
    final url = Uri.parse('https://myroute-aqn5.onrender.com/api/v1/cards');
    final response = await http.post(
      url,
      body: {
        'cardNumber': cardNumber,
        'expirationDate': expirationDate,
        'cvv': cvv,
      },
    );
    

    if (response.statusCode == 201) {
      message = "Card added successfully";
      final responseBody = json.encode(response.body);
      print(responseBody);
      print(response.body);
      return message;
    } else {
      message = response.body;
      print('Request failed with status code: ${response.statusCode}');
      return message;
    }
  }
}