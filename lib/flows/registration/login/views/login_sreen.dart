import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:myroute/flows/PassengerBookingFlow/view/BookRideHomePage/model/homepageUI.dart';
import 'package:myroute/flows/registration/SignUp/views/sign_up.dart';
import 'package:myroute/flows/registration/Forotten_password/views/forgotten_password.dart';
import 'package:myroute/flows/registration/Reg_global_File/globalfile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/app_image.dart';
import '../../../../services/connectivity_provider.dart';
import '../../../../services/user_authentication.dart';
import '../../Verification/views/verification_screen.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';




class LoginScreen extends ConsumerStatefulWidget {
  LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordCcontroller = TextEditingController();
  bool isLoading = false;
  bool emailError = false;
  bool passwordError = false;
  String firstName = '';
  String lastName = '';
  String isVerified = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordCcontroller.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();

    initializeLocationAndSave();
  }



  void  initializeLocationAndSave() async{
    try {
      Location _location = Location();
      bool? _serviceEnabled;
      PermissionStatus? _permissionGranted;

      _serviceEnabled = await _location.serviceEnabled();
      if(!_serviceEnabled){
        _serviceEnabled = await _location.requestService();
      }

      _permissionGranted = await _location.hasPermission();
      if(_permissionGranted == PermissionStatus.denied){
        _permissionGranted = await _location.requestPermission();
      }

      LocationData _locationData = await _location.getLocation();
      LatLng currentLatLng = LatLng(_locationData.latitude!, _locationData.longitude!);

      SharedPreferences prefs =
      await SharedPreferences.getInstance();

      prefs.setDouble("latitude", _locationData.latitude!);
      prefs.setDouble("longitude", _locationData.longitude!);

      print(_locationData.longitude!);
      print(_locationData.latitude!);

    } catch(e){
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    final connectivityState = ref.watch(connectivityProvider);

    final loginref = ref.watch(userAuthProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: primaryColor,
                    image: DecorationImage(
                      image: AssetImage(
                        backgroungImage,
                      ),
                    )),
                child: Center(
                  child: Image.asset(
                    appLogo,
                    width: 100,
                    height: 100,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Welcome back, Jennifer",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text('Please log in to continue'),
                  const SizedBox(
                    height: 15,
                  ),
                  mytextField(
                      errorCondition: emailError,
                      error: 'Enter a valid email',
                      controller: emailController,
                      label: "Email"),
                  const SizedBox(
                    height: 20,
                  ),
                  mytextField(
                    errorCondition: passwordError,
                    error: 'Incorrect password',
                    label: "Password",
                    isobsure: true,
                    controller: passwordCcontroller,
                    ispassword: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgetPassword(),
                          ));
                    },
                    child: Container(
                      alignment: Alignment.bottomRight,
                      child: const Text(
                        "Forgot password?",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  isLoading
                      ? Center(
                          child: LoadingAnimationWidget.inkDrop(
                              color: primaryColor, size: 25))
                      : AppButton(
                          textColor: white,
                          label: "Login",
                          onPressed: () async {
                            if (connectivityState.status ==
                                ConnectivityStatus.disconnected) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('No internet connection'),
                                  ),
                                );
                              });
                            } else {
                              setState(() {
                                isLoading = true;
                              });
                              if (emailController.text.isNotEmpty &&
                                  passwordCcontroller.text.isNotEmpty) {
                                String message = await loginref.userLogin(
                                    emailController.text,
                                    passwordCcontroller.text);

                                if (message == 'LoggedIn') {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  
                                  setState(() {
                                    firstName = prefs.getString('firstName')!;
                                    lastName = prefs.getString('lastName')!;
                                    //isVerified = prefs.getString('isVerified')!;
                                  });
                                  final String name = '$firstName $lastName';
                                  if (isVerified == false) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              VerificationScreen(
                                                  email: emailController.text),
                                        ));
                                    setState(() {
                                      isLoading = false;
                                    });
                                  } else {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) =>
                                    //       SelectedCar(),
                                    //     ));

                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                               PassengerHomeScreen(name:name),
                                        ));

                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                } else {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(message,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontSize: 16))));
                                  });
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              } else {
                                setState(() {
                                  isLoading = false;
                                });
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text(
                                        'Fill up all fields',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  );
                                });
                              }
                            }
                          },
                        ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Divider(),
                      Text("Or Log In with"),
                      Divider(
                        thickness: 10,
                        height: 10,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(
                        image: Image.asset(facebookIcon),
                        onPressed: () {},
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SocialButton(
                        image: Image.asset(googleIcon),
                        onPressed: () {},
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SocialButton(
                        image: Image.asset(appleIcon),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don’t have an account?"),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ));
                        },
                        child: const Text(
                          " Sign up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}