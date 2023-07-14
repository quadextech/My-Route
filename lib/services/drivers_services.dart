import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;


final driverServiceProvider = Provider<DriverService>((ref) => DriverService());

class DriverService {
 uploadFiles(List<String> filePaths, String expiryDate) async {
  String message = 'Something went wrong';
  final url = Uri.parse('https://myroute-aqn5.onrender.com/api/v1/upload');
var headers = {
  'Cookie': 'SESSIONID=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0YWU0M2Y5NzgyMTBjMmRjN2U1ZDMyOSIsImlhdCI6MTY4OTE0MjI2NSwiZXhwIjoxNjg5MzE1MDY1fQ.8nQHVzz79pWQNPZS3o09dAyI9ZXon7-IdJeB-7-Zbrs'
};

  var request = http.MultipartRequest('POST', url);
headers.forEach((key, value) {
    request.headers[key] = value;
  });
  for (String filePath in filePaths) {
    List<int> fileBytes = await File(filePath).readAsBytes();
    request.files.add(
      http.MultipartFile.fromBytes(
        'files',
        fileBytes,
        filename: path.basename(filePath),
      ),
    );
  }
request.fields['licenseExpiryDate'] = expiryDate;

  var response = await request.send();

  if (response.statusCode == 200) {
    message = 'Files uploaded';
    return message;
  } else {
    message = 'Files upload failed: ${response.reasonPhrase}';
    return message;
  }
}

}
