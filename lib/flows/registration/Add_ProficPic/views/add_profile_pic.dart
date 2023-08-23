import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:myroute/flows/registration/AddPayment/views/addPayment.dart';
import 'package:myroute/flows/registration/Reg_global_File/globalfile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myroute/services/connectivity_provider.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_image.dart';
import '../../../../services/update_dp.dart';
import '../../../../services/user_authentication.dart';
import '../utilities.dart';

class AddProfilePic extends ConsumerStatefulWidget {
  final String email;
  const AddProfilePic({
    super.key,
    required this.email,
  });

  ConsumerState<AddProfilePic> createState() => _AddProfilePicState();
}

class _AddProfilePicState extends ConsumerState<AddProfilePic> {
  XFile? _imageFile;
  final storage = new FlutterSecureStorage();
  bool isLoading = false;
   String dataUri = '';
  //bool isLLoading = false;

  bool isImageGood() {
    return _imageFile != null;
  }

  @override
  Widget build(BuildContext context) {
    final connectivityState = ref.watch(connectivityProvider);
    final ImageUploadref = ref.watch(userImageProvider);
    final Imageref = ref.watch(profilePicProvider);
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Add a profile picture",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Verify your identity, passengers will want to see who you are.",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Make sure it meets the requirements",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Clearly visible face \nNo sunglasses\nGood lighting, no filters.",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: grey1,
                    radius: 80,
                    backgroundImage: _imageFile == null
                        ? Image.asset(userIcon).image
                        : FileImage(File(_imageFile!.path)),
                  ),
                  Positioned(
                    bottom: 9,
                    right: 15,
                    child: GestureDetector(
                      onTap: () async {
                        ImageUploadref.uploadImage(context, (pickedImg) async {
                          setState(() {
                            _imageFile = pickedImg;
                            isLoading = true;
                          });
                          List<int> imageBytes = await pickedImg.readAsBytes();
                          String imageBase64 = base64Encode(imageBytes);
                          imageBase64 = imageBase64.replaceAll('/', '');
                          final String? mimeType =
                              lookupMimeType('', headerBytes: imageBytes);

                          setState(() {
                            isLoading = false;
                            dataUri = "data:$mimeType;base64,$imageBase64";
                          });
                        });
                      },
                      child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: primaryColor,
                            ),
                            shape: BoxShape.circle,
                            color: white,
                          ),
                          child: const Icon(Icons.edit)),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ))
                    :
                    //isImageGood()
                    // ?
                    AppButton(
                        onPressed: () async {
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
                          } else {
                            setState(() {
                              isLoading = true;
                            });

                            // );

                           
                              if (_imageFile != null) {
                                var imageResponse =
                                    await Imageref.addProfilePic(
                                        widget.email, dataUri);
                                if (imageResponse == 'updated') {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const AppPayment(),
                                    ),
                                  );
                                }
                              } else {
                                setState(() {
                                  isLoading = false;
                                });
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => const AppPayment(),
                                //   ),
                                // );
                              }
                           
                          }
                        },
                        label: "Submit",
                      ))
          ],
        ),
      ),
    );
  }
}
