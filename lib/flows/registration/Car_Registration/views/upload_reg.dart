import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mime/mime.dart';
import 'package:myroute/flows/registration/Car_Registration/views/payment_detail.dart';
import 'package:myroute/flows/registration/Reg_global_File/globalfile.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_image.dart';
import '../widget/text_header.dart';
import '../widget/upload_Button.dart';

class UploadFlieReg extends ConsumerStatefulWidget {
  final String licenseNumber;
  final String userId;
  final String refCode;
  final String vehicleManuf;
  final String vehicleModel;
  final String year;
  final String plateNumber;
  final String color;
  const UploadFlieReg({
    super.key,
    required this.userId,
    required this.licenseNumber,
    required this.refCode,
    required this.vehicleManuf,
    required this.vehicleModel,
    required this.year,
    required this.plateNumber,
    required this.color,
  });

  @override
  ConsumerState<UploadFlieReg> createState() => _UploadFlieRegState();
}

class _UploadFlieRegState extends ConsumerState<UploadFlieReg> {
  final TextEditingController expiryDateController = TextEditingController();
  late String driversLicensePath;
  late String exteriorPhotoPath;
  late String interiorPhotoPath;
  var driversLicense = '';
  var exteriorPhoto = '';
  var interiorPhoto = '';
  var isLoading = false;
 
  late List<String> filePaths = [
    driversLicensePath,
    exteriorPhotoPath,
    interiorPhotoPath,
  ];

  @override
  Widget build(BuildContext context) {
  
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextHeader(
                subTitle: "Upload documents",
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "We are legally required to ask you for some documents to register your car. Document scans and quality photos are accepted.",
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Driver’s License",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Required*",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Text(
                "Please provide a clear driver’s license showing the license number, your name and date of birth.",
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  UpLoadButton(onPressed: () async {
                    setState()async {
                    driversLicensePath = await pickFile(driversLicense);   
                    }
                    driversLicensePath = await pickFile(driversLicense);
                    
                  }),
                  const SizedBox(width: 5),
                  Text(driversLicense),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              mytextField(
                  error: '',
                  errorCondition: false,
                  controller: expiryDateController,
                  label: "Driver’s License expiry date*"),
              const Text("License number on your Driver’s documents"),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Exterior Photo of your Car",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Required*",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Upload a clear exterior photo that captures the plate number.",
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  UpLoadButton(onPressed: () async {
                    setState(() async{
                        exteriorPhotoPath = await pickFile(exteriorPhoto);
                     
                    });
                    exteriorPhotoPath = await pickFile(exteriorPhoto);
                    
                  }),
                  const SizedBox(width: 5),
                  Text(exteriorPhoto),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Interior Photo of your Car",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Required*",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Upload a clear interior photo of your car.",
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  UpLoadButton(onPressed: () async {
                    setState(() async{
                      
 interiorPhotoPath = await pickFile(interiorPhoto);
                    });
                   

                  }),
                  const SizedBox(width: 5),
                  Text(interiorPhoto),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              isLoading
                  ? Center(
                      child: LoadingAnimationWidget.inkDrop(
                          color: primaryColor, size: 25),
                    )
                  : AppButton(textColor: white,
                      onPressed: () async {
                        if (driversLicensePath != '' &&
                            interiorPhotoPath != '' &&
                            exteriorPhotoPath != '' &&
                            expiryDateController.text.isNotEmpty) {
                         

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentDetail(vehicleColor: widget.color,
                                    userId: widget.userId,
                                    referralCode: widget.refCode,
                                    vehicleManufacturer: widget.vehicleManuf,
                                    vehicleModel: widget.vehicleModel,
                                    vehicleyear: widget.year,
                                    platenumberlicense: widget.plateNumber,
                                    driverlicensenumber: widget.licenseNumber,
                                    driverlicense: driversLicense,
                                    driverlicenseexpiryDate:
                                        expiryDateController.text,
                                    outSideCarPhoto: exteriorPhotoPath,
                                    inSideCarPhoto: interiorPhotoPath,
                                  ),
                                ));
                         
                           
                         
                        }
                      },
                      label: "Next"),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future pickFile(docName) async {
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
      String docBase64 = base64Encode(fileBytes);
      docBase64 = docBase64.replaceAll('/', '');
      final String? mimeType = lookupMimeType('', headerBytes: fileBytes);

      final String dataUri = "data:$mimeType;base64,$docBase64";

      setState(() {
        docName = platformFile.name;
      });

      return dataUri;
    } else {
      String message = 'File picking canceled';
      return message;
    }
  }
}
