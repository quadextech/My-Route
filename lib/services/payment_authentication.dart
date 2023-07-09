import 'package:http/http.dart' as http;
import 'dart:convert';


class AddPayment{
void verifyCardDetails() async {
  final url = Uri.parse('https://api.example.com/verify-card');
  final response = await http.post(
    url,
    body: {
      'cardNumber': '1234567890123456',
      'expirationDate': '12/2023',
      'cvv': '123',
    },
  );

  if (response.statusCode == 200) {
    // Request successful, parse the response
    final responseBody = json.decode(response.body);
    // Process the response data
    // ...
  } else {
    // Request failed, handle the error
    print('Request failed with status code: ${response.statusCode}');
  }
}

}