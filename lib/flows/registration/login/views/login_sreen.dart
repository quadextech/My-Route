import 'package:flutter/material.dart';
import 'package:myroute/constants/constant.dart';
import 'package:myroute/flows/PassengerBookingFlow/view/BottomNavigatorBar.dart';
import 'package:myroute/flows/registration/SignUp/views/sign_up.dart';
import 'package:myroute/flows/registration/Forotten_password/views/forgotten_password.dart';
import 'package:myroute/flows/registration/Reg_global_File/globalfile.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordCcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  mytextField(controller: emailController, label: "Email"),
                  const SizedBox(
                    height: 20,
                  ),
                  mytextField(
                    label: "Password",
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
                  AppButton(
                    label: "Login",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNav(),
                          ));
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
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
