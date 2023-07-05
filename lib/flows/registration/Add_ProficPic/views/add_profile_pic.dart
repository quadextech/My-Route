import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myroute/flows/registration/AddPayment/views/addPayment.dart';
import 'package:myroute/flows/registration/Reg_global_File/globalfile.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/app_image.dart';
import '../utilities.dart';

class AddProfilePic extends StatefulWidget {
  const AddProfilePic({super.key});

  State<AddProfilePic> createState() => _AddProfilePicState();
}

class _AddProfilePicState extends State<AddProfilePic> {
  XFile? _imageFile;
  ImageUpload imageUpload = ImageUpload();
  bool isLoading = false;

  bool isImageGood() {
    return _imageFile != null;
  }

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
                  backgroundColor: grey,
                  radius: 80,
                  backgroundImage: _imageFile == null
                      ? Image.asset(userIcon).image
                      : FileImage(File(_imageFile!.path)),
                ),
                Positioned(
                  bottom: 9,
                  right: 15,
                  child: GestureDetector(
                    onTap: () {
                      imageUpload.uploadImage(context, (pickedImg) {
                        setState(() {
                          _imageFile = pickedImg;
                          isLoading = true;
                        });

                        Future.delayed(Duration(seconds: 5), () {
                          setState(() {
                            isLoading = false;
                          });
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
            )),
            const SizedBox(
              height: 20,
            ),
            Container(
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ))
                    : isImageGood()
                        ? AppButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AppPayment(),
                                ),
                              );
                            },
                            label: "Looks good! Proceed",
                          )
                        : null)
          ],
        ),
      ),
    );
  }
}
