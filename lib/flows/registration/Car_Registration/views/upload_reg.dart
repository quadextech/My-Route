import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:myroute/flows/registration/Car_Registration/views/payment_detail.dart';
import 'package:myroute/flows/registration/Reg_global_File/globalfile.dart';
import 'package:file_picker/file_picker.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_image.dart';
import '../../../../services/drivers_services.dart';
import '../widget/text_header.dart';
import '../widget/upload_Button.dart';
import 'package:path/path.dart' as path;

class UploadFlieReg extends ConsumerStatefulWidget {
  const UploadFlieReg({super.key});

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
  late List<String> filePaths = [
    driversLicensePath,
    exteriorPhotoPath,
    interiorPhotoPath,
  ];

  @override
  Widget build(BuildContext context) {
    final uploadFilesRef = ref.watch(driverServiceProvider);
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
                    driversLicensePath = await pickFile();
                    setState(() {
                      driversLicense = path.basename(driversLicensePath);
                    });
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
                    exteriorPhotoPath = await pickFile();
                    setState(() {
                      exteriorPhoto = path.basename(exteriorPhotoPath);
                    });
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
                    interiorPhotoPath = await pickFile();

                    setState(() {
                      interiorPhoto = path.basename(interiorPhotoPath);
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
                  : AppButton(
                      onPressed: () async {
                       
                        if (driversLicensePath != '' &&
                            interiorPhotoPath != '' &&
                            exteriorPhotoPath != '' &&
                            expiryDateController.text.isNotEmpty) {
                               setState(() {
                          isLoading = true;
                        });
                          var message = await uploadFilesRef.uploadFiles(
                              filePaths, expiryDateController.text);

                          if (message == 'File uploaded') {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'File Uploaded',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentDetail(),
                              )); } else {
                            setState(() {
                              isLoading = false;
                            });
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    message,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            });
                          }

                         
                        }else{
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(backgroundColor: Colors.red,
                                  content: Text(
                                    'Fill up all fields',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            });
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

  Future<String> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      return file.path!;
    } else {
      String message = 'File picking canceled';
      return message;
    }
  }
}