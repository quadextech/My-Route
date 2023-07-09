import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final userAuthProvider = Provider<UserAuth>((ref) => UserAuth());

class UserAuth {
  userSignUp(
    email,
    password,
    firstName,
    lastName,
    phone,
    gender,
  ) async {
    String message = 'Something went wrong';

    final url =
        Uri.parse('https://myroute-aqn5.onrender.com/api/v1/users/signup');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
        'lastName': lastName,
        'firstName': firstName,
        'phone': phone,
        'gender': gender,
      }),
    );
    if (response.statusCode == 200) {
      message = 'Sign Up Successful';
      return message;
    } else {
      message = response.body;
      return message;
    }
  }

  userLogin(email, password) async {
    String message = 'Something went wrong';
    final url =
        Uri.parse('https://myroute-aqn5.onrender.com/api/v1/users/login');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
    } else {
      message = response.body;
      return message;
    }
  }
}
