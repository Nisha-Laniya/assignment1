import 'package:assignment1/reusable_widgets/reusable_widgets.dart';
import 'package:assignment1/screens/dashboard_screen.dart';
import 'package:assignment1/screens/login_screen.dart';
import 'package:assignment1/utils/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmPasswordTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title:Text(
            'Sign Up',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration:BoxDecoration(
              gradient: LinearGradient(colors: [
            ColorConstants.pink,
            ColorConstants.green,
          ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 20,top: 120,right: 20).r,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    reusableTextField('Enter UserName', Icons.person_outline,
                        false, _usernameTextController, "username"),
                    SizedBox(
                      height: 15.h,
                    ),
                    reusableTextField('Enter Email', Icons.email_outlined,
                        false, _emailTextController, "email"),
                    SizedBox(
                      height: 15.h,
                    ),
                    reusableTextField('Enter Password', Icons.lock_outline,
                        true, _passwordTextController, "password"),
                    SizedBox(
                      height: 15.h,
                    ),
                    reusableTextField(
                        'Enter Confirm Password',
                        Icons.lock_outline,
                        true,
                        _confirmPasswordTextController,
                        "confirm password"),
                    SizedBox(
                      height: 15.h,
                    ),
                    reusableButton(context, "SIGN UP", () {
                      if (_formKey.currentState!.validate()) {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _emailTextController.text,
                                password: _passwordTextController.text)
                            .then((value) {
                          print('Account created successfully');
                          final auth = FirebaseAuth.instance.currentUser;
                          auth!.updateDisplayName(_usernameTextController.text);
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DashBoardScreen()));
                        }).onError((error, stackTrace) {
                          print("Error ${error.toString()}");
                        });
                      }
                    })
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
