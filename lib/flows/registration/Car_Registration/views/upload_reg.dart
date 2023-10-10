import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mime/mime.dart';
import 'package:myroute/constants/textstyle.dart';
import 'package:myroute/flows/registration/Car_Registration/views/payment_detail.dart';
import 'package:myroute/flows/registration/Reg_global_File/globalfile.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_image.dart';
import '../../../../services/connectivity_provider.dart';
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
  late var driversLicensePath;
  late var exteriorPhotoPath;
  late var interiorPhotoPath;
  var driversLicense = '';
  var exteriorPhoto = '';
  var interiorPhoto = '';
  var isLoading = false;


  var docName = '';
  var licenseDocName ='';
  var ExtDocName ='';
  var IntDocName ='';



  bool ExternalPicError = false;
  bool InternalPicError = false;
  bool DriverLicensePicError = false;
  bool ExpiryDateError = false;
 
  late List<String> filePaths = [
    driversLicensePath,
    exteriorPhotoPath,
    interiorPhotoPath,
  ];

  @override
  Widget build(BuildContext context) {
    final connectivityState = ref.watch(connectivityProvider);
  
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
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
              const Row(
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

                  UpLoadButton(
                      onPressed: () async{
                        var pickedDriverLicensePath = await pickLicenseFile();
                        setState(() {
                          driversLicensePath = pickedDriverLicensePath;
                         
                        });
                      }),
                  const SizedBox(width: 5),
                  Text(licenseDocName),
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
              const Row(
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
                    var pickedExteriorPhotoPath = await pickExtFile();
                    setState(() {
                        exteriorPhotoPath = pickedExteriorPhotoPath;

                    });
                    //exteriorPhotoPath = await pickFile(exteriorPhoto);

                  }),
                  const SizedBox(width: 5),
 
                 Text(exteriorPhoto,style: body4(black, TextDecoration.none),),

                 Text(ExtDocName),

                  //
                  // Text(
                  //   ExternalPicError ? 'Upload your Car External Picture' : ExtDocName,
                  //   overflow: TextOverflow.ellipsis,
                  //   style: TextStyle(
                  //       fontFamily: "Avenir",
                  //       fontSize: 10,
                  //       color: ExternalPicError ? errorColor : black),
                  // ),

                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
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
                    var pickedInteriorPhotoPath = await pickIntFile();
                    setState(() {

 interiorPhotoPath = pickedInteriorPhotoPath;
                    });


                  }),
                  const SizedBox(width: 5),
                  Text(IntDocName),
                  // Text(
                  //   InternalPicError ? 'Upload your Car External Picture' : IntDocName,
                  //   overflow: TextOverflow.ellipsis,
                  //   style: TextStyle(
                  //       fontFamily: "Avenir",
                  //       fontSize: 10,
                  //       color: InternalPicError ? errorColor : black),
                  // ),
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
                    print(driversLicensePath);
                    print(interiorPhotoPath);
                    print(exteriorPhotoPath);
                    print(expiryDateController.text);



                        if (connectivityState.status ==
                            ConnectivityStatus.disconnected) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'No internet connection',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          });
                        } else{
                          setState(() {
                              isLoading = true;
                          });
                          if (driversLicense == ''){
                            setState(() {
                              DriverLicensePicError = true;
                              isLoading = false;
                            });
                          }
                          if (exteriorPhoto == ''){
                            setState(() {
                              ExternalPicError = true;
                              isLoading = false;
                            });
                          }

                          if (interiorPhoto == ''){
                            setState(() {
                              InternalPicError = true;
                              isLoading = false;
                            });
                          }

                          if (expiryDateController.text.isEmpty){
                            setState(() {
                              ExpiryDateError = true;
                              isLoading = false;
                            });
                          }
                        }

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
                                    driverlicense: driversLicensePath,
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


  Future pickExtFile() async {
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
        ExtDocName = platformFile.name;
       // print(docName);
      });

      return dataUri;
    } else {
      String message = 'File picking canceled';
      return message;
    }
  }

  Future pickIntFile() async {
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
        IntDocName = platformFile.name;
        // print(docName);
      });

      return dataUri;
    } else {
      String message = 'File picking canceled';
      return message;
    }
  }


  Future pickLicenseFile() async {
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
        licenseDocName = platformFile.name;
        // print(docName);
      });

      return dataUri;
    } else {
      String message = 'File picking canceled';
      return message;
    }
  }
}