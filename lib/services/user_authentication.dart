import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final userAuthProvider = Provider<UserAuth>((ref) => UserAuth());

class UserAuth {
  userSignUp(email, password, firstName, lastName, phone, gender,
      String ninDoc) async {
    String message = 'Something went wrong';

    final url =
        Uri.parse('https://myroute-aqn5.onrender.com/api/v1/users/signup');
    // List<int> imageBytes = await ninDoc.readAsBytes();
    // String ninDocBase64 = base64Encode(imageBytes);
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
        'ninDocument': ninDoc
      }),
    );
    if (response.statusCode == 201) {
      message = 'Sign Up Successful';
      final responseData = json.decode(response.body);
      
      final token = responseData['token'];
      final id = responseData['data']['user']['_id'];
      if (token != null && id != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);
        prefs.setString('id', id);
      }
      return message;
    } else {
      message = response.body;
      print(message);
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
    if (response.statusCode == 201) {
      message = 'Login Successful';
      return message;
    } else {
      message = response.body;
      return message;
    }
  }

  Future verifyUser(email, verificationCode) async {
    String message = 'Wrong code';
    final url =
        Uri.parse('https://myroute-aqn5.onrender.com/api/v1/users/verify-user');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'verificationCode': verificationCode,
      }),
    );
    if (response.statusCode == 201) {
      message = 'verified';
      return message;
    } else {
      message = response.body;
      return message;
    }
  }

  Future resendVerificationCode(email) async {
    String message = '';
    final url =
        Uri.parse('https://myroute-aqn5.onrender.com/api/v1/users/resend-code');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
      }),
    );
    if (response.statusCode == 201) {
      message = 'verified';
      return message;
    } else {
      message = response.body;
      return message;
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }
}
