import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myroute/flows/registration/AddPayment/views/addPayment.dart';
import 'package:myroute/flows/registration/Reg_global_File/globalfile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myroute/services/connectivity_provider.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_image.dart';
import '../../../../services/user_authentication.dart';
import '../utilities.dart';

class AddProfilePic extends ConsumerStatefulWidget {
  const AddProfilePic({super.key});

  ConsumerState<AddProfilePic> createState() => _AddProfilePicState();
}

class _AddProfilePicState extends ConsumerState<AddProfilePic> {
  XFile? _imageFile;
  final storage = new FlutterSecureStorage();
  bool isLoading = false;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordCcontroller = TextEditingController();
  TextEditingController passwordCcontroller2 = TextEditingController();
  var sex = "Male";


  //bool isLLoading = false;

  bool isImageGood() {
    return _imageFile != null;
  }

  @override
  Widget build(BuildContext context) {
    final connectivityState = ref.watch(connectivityProvider);
    final ImageUploadref = ref.watch(userImageProvider);
    final signUpref = ref.watch(userAuthProvider);
    final Imageref = ref.watch(userAuthProvider);
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
                      ImageUploadref.uploadImage(context, (pickedImg) {
                        setState(() {
                          _imageFile = pickedImg;
                          isLoading = true;
                        });

                        // Future.delayed(Duration(seconds: 5), () {
                        //   setState(() {
                        //     isLoading = false;
                        //   });
                        // });
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
                    :
                //isImageGood()
                       // ?
                AppButton(
                  onPressed: () async {
                    if (connectivityState.status == ConnectivityStatus.disconnected) {
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

                      String message = await signUpref.userSignUp(
                        emailController.text,
                        passwordCcontroller.text,
                        firstNameController.text,
                        lastNameController.text,
                        phoneNumberController.text,
                        sex,
                      );

                      if (message == 'Sign Up Successful') {
                        if (_imageFile != null) {
                          var imageResponse = await Imageref.userAvatar(_imageFile!.path);
                          if (imageResponse.statusCode == 200) {
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
                      } else {
                        setState(() {
                          isLoading = false;
                        });
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