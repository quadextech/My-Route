import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mime/mime.dart';
import 'package:myroute/flows/registration/AddPayment/views/addPayment.dart';
import 'package:myroute/flows/registration/Reg_global_File/App_button.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../constants/app_color.dart';
import '../../constants/app_image.dart';
import '../../constants/textstyle.dart';
import '../../services/connectivity_provider.dart';
import 'Car_Registration/widget/upload_Button.dart';
import 'Reg_global_File/back_button.dart';
import 'dart:io';




class NinRegistration extends ConsumerStatefulWidget {
  const NinRegistration({Key? key}) : super(key: key);

  @override
  ConsumerState<NinRegistration> createState() => _NinRegistrationState();
}

class _NinRegistrationState extends ConsumerState<NinRegistration> {

  bool ninError = false;
  bool passwordMismatch = false;
  bool isLoading = false;
  bool isPicked = false;


  late var ninDocPath;
  var ninDoc = '';

  @override
  Widget build(BuildContext context) {
    final connectivityState = ref.watch(connectivityProvider);
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Image.asset(
          appLogo2,
          width: 120,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("NIN Document",
                    style: body2(black, TextDecoration.none)),
                Text("Required*",
                    style: body3(errorColor, TextDecoration.none)),
              ],
            ),
            SizedBox(height: 20,),
            Text(
                "Please provide a clear NIN document showing the NIN, your name and date of birth.",
                style: body3(black, TextDecoration.none)),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                UpLoadButton(onPressed: () async {
                  var pickedNinDocPath = await pickFile();
                  setState(() {
                    ninDocPath = pickedNinDocPath;
                    ninError = false;
                  });
                }),

                const SizedBox(width: 5),
                Text(
                  ninError ? 'Upload your NIN' : ninDoc,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: "Avenir",
                      fontSize: 13,
                      color: ninError ? errorColor : black),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            AppButton(onPressed: (){
              MaterialPageRoute(
                builder: (context) => const AppPayment(),
              );
            }, label: 'Submit', textColor: white, buttonColor: black,),

            const SizedBox(
              height: 20,
            ),

            AppButton(onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AppPayment(),
                  ));
            }, label: 'Skip', textColor: white, buttonColor: black,),

          ],
        )






      ),
    );
  }

  Future pickFile() async {
    PermissionStatus status = await Permission.storage.status;
    if (status.isRestricted || status.isPermanentlyDenied) {
      status = await Permission.storage.request();
    }
    if (status.isDenied) {
      await Permission.storage.request();
    }
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile platformFile = result.files.first;


      File file = File(platformFile.path!);

      List<int> fileBytes = await file.readAsBytes();
      String ninDocBase64 = base64Encode(fileBytes);
      String ninDocBase = ninDocBase64.replaceAll('/', '');
      final String? mimeType = lookupMimeType('', headerBytes: fileBytes);

      final String dataUri = "data:$mimeType;base64,$ninDocBase";

      setState(() {
        ninDoc = platformFile.name;
      });
      print(dataUri);
      return dataUri;
    } else {
      String message = 'File picking canceled';
      return message;
    }
  }

}