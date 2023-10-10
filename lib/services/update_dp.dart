import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final profilePicProvider = Provider<ProfilePic>((ref) => ProfilePic());

class ProfilePic{

    Future addProfilePic(email, profilePic) async {
    String message = '';
     final url =
        Uri.parse('https://myroute-aqn5.onrender.com/api/v1/users/update-account');
    final response = await http.patch(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'profilePic':profilePic
        
      }),
    );
    if (response.statusCode == 200) {
      message = 'updated';
      return message;
    }
    else {
      message = response.body;
      return message;
    }
  }
}