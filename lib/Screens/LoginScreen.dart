import 'package:elison/Components/ForgotPassword.dart';
import 'package:elison/Components/InputFeild.dart';
import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Screens/MainScreen.dart';
import 'package:elison/Screens/RegisterScreen.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                "assets/images/login.png",
                width: size.width / 1.2,
                height: size.height / 3,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: size.height / 8),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Text(
                    "Welcom Back",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "we are always happy to serve you !!",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 25),
                  InputField(
                    size: 50,
                    hint: "Email",
                    borderRadius: 15,
                    icon: Icons.mail_outline,
                    color: Colors.grey.shade100,
                  ),
                  const SizedBox(height: 15),
                  InputField(
                    size: 50,
                    password: true,
                    hint: "Password",
                    borderRadius: 15,
                    icon: Icons.lock_outline,
                    color: Colors.grey.shade100,
                  ),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => ForgotPasswordDialog(),
                        );
                      },
                      child: Text(
                        "Forgot Password ?",
                        style: TextStyle(
                          fontSize: 14,
                          color: primaryColor,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  MyButton(
                    title: "Login",
                    fontSize: 14,
                    sizeHieght: 50,
                    onTap: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      Navigator.of(context).pushReplacementNamed(
                        MainScreen.routeName,
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey)),
                      Text(
                        " Or ",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 15),
                  RichText(
                    text: TextSpan(
                      text: "Create a new account?",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: " Register",
                          style: TextStyle(
                            fontSize: 14,
                            color: primaryColor,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushNamed(
                                RegisterScreen.routeName,
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
