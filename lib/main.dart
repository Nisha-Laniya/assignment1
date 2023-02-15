import 'package:assignment1/screens/dashboard_screen.dart';
import 'package:assignment1/screens/login_screen.dart';
import 'package:assignment1/screens/resetpassword_screen.dart';
import 'package:assignment1/screens/signup_screen.dart';
import 'package:assignment1/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360,690),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          // initialRoute: '/',
          // routes: {
          //   '/': (context) => SplashScreen(),
          //   '/login': (context) => LoginScreen(),
          //   '/signup' : (context) => SignUpScreen(),
          //   '/reset password' : (context) => ResetPasswordScreen(),
          //   '/dashboard' : (context) => DashBoardScreen(),
          // },
        );
      },

    );
  }
}
