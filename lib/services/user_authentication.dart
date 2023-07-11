import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final userAuthProvider = Provider<UserAuth>((ref) => UserAuth());

final storage = new FlutterSecureStorage();

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
    String? token = await storage.read(key: "token");
    final url =
        Uri.parse('https://myroute-aqn5.onrender.com/api/v1/users/signup');

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
      }),
    );
    if (response.statusCode == 200) {
      message = 'Sign Up Successful';
      Map<String, dynamic> output = jsonDecode(response.body);
      print(output["token"]);
      await storage.write(key: "token", value: output["token"]);
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
       message = 'Login Successful';
      return message;
    } else {
      message = response.body;
      return message;
    }
  }

  Future<http.StreamedResponse>userAvatar(String filepath) async {
    String message = 'Something went wrong';
    String? token = await storage.read(key: "token");
    final url =
    Uri.parse('https://myroute-aqn5.onrender.com/api/v1/users/signup');
    final request = await http.MultipartRequest(
      'PATCH',
      url);
    request.files.add(await http.MultipartFile.fromPath("img", filepath));
    request.headers.addAll({
      "Content-type": "multipart/form-data",
      "Authorization": "Bearer $token",
    });
    var response = request.send();
    return response;

  }
}