import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
final cardVerificationProvider = Provider<AddPayment>((ref)=> AddPayment());
class AddPayment {
   verifyCardDetails(cardNumber, expirationDate, cvv, userId) async {
        String message = 'Something went wrong';
    final url = Uri.parse('https://myroute-aqn5.onrender.com/api/v1/cards');
    final response = await http.post(
      url,
      body: {
        'CardNo': cardNumber,
        'ExpiryDate': expirationDate,
        'SecureCode': cvv,
        'userId': userId,
      },
    );
    

    if (response.statusCode == 201) {
      message = "Card added successfully";
      
      return message;
    } else {
      message =  json.encode(response.body);
      return message;
    }
  }
}