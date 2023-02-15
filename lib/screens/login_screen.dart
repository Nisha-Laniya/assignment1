import 'package:assignment1/screens/dashboard_screen.dart';
import 'package:assignment1/screens/resetpassword_screen.dart';
import 'package:assignment1/screens/signup_screen.dart';
import 'package:assignment1/utils/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../reusable_widgets/reusable_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          ColorConstants.pink,
          ColorConstants.green,
        ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20,top: MediaQuery.of(context).size.height * 0.2, right: 20).r,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  loginTitle('Zignuts Technolab'),
                  SizedBox(
                    height: 30.h,
                  ),
                  reusableTextField('Enter Email', Icons.email_outlined, false,
                      _emailTextController, "email"),
                  SizedBox(
                    height: 15.h,
                  ),
                  reusableTextField('Enter Password', Icons.lock_outline, true,
                      _passwordTextController, "password"),
                  forgotPasswordOption(),
                  SizedBox(
                    height: 15.h,
                  ),
                  reusableButton(context, "LOG IN", () {
                    if (_formKey.currentState!.validate()) {
                      FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text).then((value) {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DashBoardScreen()));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                    }
                  }),
                  SizedBox(
                    height: 15.h,
                  ),
                  signUpOption(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          "Don't have account?",
          style: TextStyle(color: ColorConstants.white2),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: Text(
            ' Sign Up',
            style: TextStyle(color:ColorConstants.white1, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
  
  Widget forgotPasswordOption() {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ResetPasswordScreen()));
        },
        child:Padding(
          padding: EdgeInsets.only(right: 5,top: 5).r,
          child: const Text(
              'Forgot Password ?',
              style: TextStyle(color: Colors.white70),
          ),
        ),
      ),
    );
  }
}
