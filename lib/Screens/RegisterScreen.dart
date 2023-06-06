import 'package:elison/Components/InputFeild.dart';
import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Screens/MainScreen.dart';
import 'package:elison/Screens/TrainerBioScreen.dart';
import 'package:elison/Screens/customer_terms_conditions.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/controllers/register_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

import '../Components/snackbar.dart';
import 'customer_privacy_policy.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final registercontroller =
      Get.put(RegisterController(context: Get.arguments[0]));
  changeState(bool? status) {
    registercontroller.isCheck.value = status!;
    setState(() {});
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    var size = MediaQuery.of(context).size;
    return Obx(() {
      return Scaffold(
        body: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    "assets/images/register.png",
                    width: size.width / 1.2,
                    height: size.height / 4,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Text(
                        "Hey There",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Create an Account",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SelectUserType(
                            user: 'I\'m User',
                            selectedUser: registercontroller.selectedUser.value,
                            onTap: () {
                              registercontroller.selectedUser.value =
                                  'I\'m User';
                              setState(() {});
                            },
                          ),
                          SelectUserType(
                            user: 'I\'m Trainer',
                            selectedUser: registercontroller.selectedUser.value,
                            onTap: () {
                              registercontroller.selectedUser.value =
                                  'I\'m Trainer';
                              setState(() {});
                              print(registercontroller.selectedUser.value);
                            },
                          ),
                        ],
                      ),
                      InputField(
                        size: 50,
                        hint: "Full Name",
                        controller: registercontroller.fullname,
                        borderRadius: 15,
                        validator: MultiValidator([
                          RequiredValidator(
                            errorText: 'Full Name required',
                          ),
                        ]),
                        icon: Icons.person_outline,
                        color: Colors.grey.shade100,
                      ),
                      const SizedBox(height: 15),
                      InputField(
                        size: 50,
                        hint: "Email",
                        controller: registercontroller.email,
                        borderRadius: 15,
                        icon: Icons.mail_outline,
                        validator: MultiValidator([
                          EmailValidator(
                            errorText: 'Please enter valid email',
                          ),
                          RequiredValidator(errorText: 'Email required')
                        ]),
                        color: Colors.grey.shade100,
                      ),
                      const SizedBox(height: 15),
                      InputField(
                        validator: MultiValidator([
                          RequiredValidator(
                            errorText: 'Phone Number required',
                          ),
                          LengthRangeValidator(
                              min: 10, max: 15, errorText: 'Length range 10-15')
                        ]),
                        size: 50,
                        hint: "Phone Number",
                        controller: registercontroller.phone,
                        borderRadius: 15,
                        icon: Icons.call,
                        type: TextInputType.phone,
                        color: Colors.grey.shade100,
                      ),
                      const SizedBox(height: 15),
                      InputField(
                        size: 50,
                        password: true,
                        hint: "Password",
                        validator: MultiValidator([
                          RequiredValidator(
                            errorText: 'Password required',
                          ),
                        ]),
                        controller: registercontroller.password,
                        borderRadius: 15,
                        icon: Icons.lock_outline,
                        color: Colors.grey.shade100,
                      ),
                      const SizedBox(height: 15),
                      InputField(
                        size: 50,
                        password: true,
                        controller: registercontroller.confirmpassword,
                        hint: "Confirm Password",
                        validator: MultiValidator([
                          RequiredValidator(
                            errorText: 'Confirm Password required',
                          ),
                        ]),
                        borderRadius: 15,
                        icon: Icons.lock_outline,
                        color: Colors.grey.shade100,
                      ),
                      Transform(
                        transform: Matrix4.translationValues(-10, 0, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Transform(
                              transform: Matrix4.translationValues(0, 5, 0),
                              child: Checkbox(
                                value: registercontroller.isCheck.value,
                                onChanged: changeState,
                                activeColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.blueGrey,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  text: "By continuing you accept our ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: [
                                    WidgetSpan(
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    PrivacyPolicy(),
                                              ));
                                        },
                                        child: Text(
                                          "Privacy Policy",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w500,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: Colors.blueGrey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextSpan(
                                      text: " and ",
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    WidgetSpan(
                                        child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  TermsConditions(),
                                            ));
                                      },
                                      child: Text(
                                        "Terms of Use",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.blueGrey,
                                        ),
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      MyButton(
                        title: registercontroller.isLoading.value
                            ? 'Loading...'
                            : "Register",
                        fontSize: 14,
                        sizeHieght: 50,
                        color: secondaryColor,
                        onTap: () {
                          if (registercontroller.confirmpassword.text ==
                              registercontroller.password.text) {
                            if (registercontroller.isCheck.value) {
                              if (_formKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                                registercontroller.register(context);
                              }
                            } else {
                              snackbar(
                                  context: context,
                                  msg: 'Please Accept terms and policies',
                                  title: 'Failed');
                            }
                          } else {
                            snackbar(
                                context: context,
                                msg:
                                    'Password and Confirm Password should match',
                                title: 'Failed');
                          }
                          // if (registercontroller.selectedUser.value ==
                          //     "I\'m Trainer") {
                          //   Navigator.of(context).popUntil(
                          //     (route) => route.isFirst,
                          //   );
                          //   Navigator.of(context).pushReplacementNamed(
                          //     TrainerHomeScreen.routeName,
                          //   );
                          // } else {
                          //   Navigator.of(context).popUntil(
                          //     (route) => route.isFirst,
                          //   );
                          //   Navigator.of(context).pushReplacementNamed(
                          //     MainScreen.routeName,
                          //   );
                          // }
                        },
                      ),
                      const SizedBox(height: 12),
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
                      const SizedBox(height: 12),
                      RichText(
                        text: TextSpan(
                          text: "Already have an account?",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: " Login",
                              style: TextStyle(
                                fontSize: 14,
                                color: primaryColor,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pop();
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
        ),
      );
    });
  }
}

class SelectUserType extends StatelessWidget {
  final String user;
  final String selectedUser;
  final Function() onTap;

  const SelectUserType({
    required this.user,
    required this.selectedUser,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Radio(
            value: user,
            activeColor: primaryColor,
            groupValue: selectedUser,
            onChanged: (_) => onTap(),
          ),
          Text(
            user,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
