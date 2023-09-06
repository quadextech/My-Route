import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final userAuthProvider = Provider<UserAuth>((ref) => UserAuth());


final storage = new FlutterSecureStorage();

class UserAuth {
  userSignUp(email, password, firstName, lastName, phone, gender,
      String ninDoc) async {


    String message = 'Something went wrong';
    String? token = await storage.read(key: "token");
    try{
    final url =
        Uri.parse('https://myroute-aqn5.onrender.com/api/v1/users/signup');
    // List<int> imageBytes = await ninDoc.readAsBytes();
    // String ninDocBase64 = base64Encode(imageBytes);
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token"

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

        Map<String, dynamic> output = jsonDecode(response.body);
        print(response.body);
        print(output["token"]);
        await storage.write(key: "token", value: output["token"]);

        final responseData = json.decode(response.body);

        final token = responseData['token'];
        final id = responseData['data']['user']['_id'];
        if (token != null && id != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('token', token);
          prefs.setString('id', id);
        }
        return message;
      }
      if (response.statusCode == 403) {
        message = 'This Email has been registered';
        return message;
      } else {
        message = response.body;
        print(message);
        print(response.body);
        print(response.statusCode);
        return message;
      }
    }
    catch(e){
      print(e);

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
      final responseData = json.decode(response.body);
      final token = responseData['token'];
      final id = responseData['data']['user']['_id'];
      final firstName = responseData['data']['user']['firstName'];
      final lastName = responseData['data']['user']['lastName'];
      final email = responseData['data']['user']['email'];
      final phoneNumber = responseData['data']['user']['phone'];
      final gender = responseData['data']['user']['gender'];
      final isVerified = responseData['data']['user']['isVerified'];
      final profilePic = responseData['data']['user']['profilePic'];

      if (token != null && id != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);
        prefs.setString('id', id);
        prefs.setString('firstName', firstName);
        prefs.setString('lastName', lastName);
        prefs.setString('email', email);
        prefs.setString('phoneNumber', phoneNumber);
        prefs.setString('gender', gender);
        prefs.setString('isVerified', isVerified);
        prefs.setString('profilePic', profilePic);
        message = 'LoggedIn';
        return message;
      } else {
        message = response.body;

        return message;
      }
    }
  }

  Future verifyUser(email, otp) async {
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
        'OTP': otp,
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