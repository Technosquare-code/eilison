import 'package:elison/Components/InputFeild.dart';
import 'package:elison/Components/MyButtton.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class ForgotPasswordDialog extends StatelessWidget {
  // final Function(String email) onPressed;
  // final emailController = TextEditingController();
  final logincontroller = Get.find<LoginController>();
  final _formKey = GlobalKey<FormState>();

  // ForgotPasswordDialog(this.onPressed);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 3,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1,
        height: MediaQuery.of(context).size.height / 3.2,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              transform: Matrix4.translationValues(0, -55, 0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 60,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Image.asset(
                    "assets/images/passwordkey.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 70),
              child: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          InputField(
                            size: 48,
                            hint: "Enter Your Email",
                            borderRadius: 5,
                            controller: logincontroller.forgotemail,
                            validator: MultiValidator([
                              EmailValidator(
                                errorText: 'Please enter valid email',
                              ),
                              RequiredValidator(errorText: 'Email required')
                            ]),
                            icon: Icons.email,
                            color: Colors.white,
                            borderColor: Colors.grey,
                            type: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 20),
                          MyButton(
                            title: "Submit",
                            fontSize: 14,
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                                logincontroller.forgotpassword();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
