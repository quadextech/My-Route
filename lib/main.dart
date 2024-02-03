import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myroute/constants/app_color.dart';
import 'package:myroute/flows/registration/login/views/login_sreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


late SharedPreferences prefs;




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
        designSize: const Size(428, 964),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MyRoute',
          theme: ThemeData(
            primarySwatch: myCustomColor,
            fontFamily: "Avenir",
          ),
          home:  LoginScreen(),
        );
      }
    );
  }
}