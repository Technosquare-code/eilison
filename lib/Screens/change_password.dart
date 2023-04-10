import 'package:elison/controllers/customer/profile/change%20Password/change_password_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

import '../Components/InputFeild.dart';
import '../Components/MyButtton.dart';
import '../Components/snackbar.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});
  final _formKey = GlobalKey<FormState>();
  final changepasscontroller = Get.put(ChangepasController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black,
            size: 20,
          ),
        ),
        title: Text(
          "Change Password",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 15),
        child: Obx(() {
          return Form(
            key: _formKey,
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Setup your New Password",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  "Current Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                InputField(
                  color: Colors.grey.shade50,
                  size: 50,
                  borderColor: Colors.grey.shade300,
                  hint: "Enter Your Current Password",
                  controller: changepasscontroller.current,
                  validator: MultiValidator([
                    // EmailValidator(
                    //   errorText: 'Please enter valid email',
                    // ),
                    RequiredValidator(errorText: 'Current Password required')
                  ]),
                  // type: TextInputType.text,
                  icon: Icons.lock_outline,
                ),
                const SizedBox(height: 15),
                Text(
                  "New Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                InputField(
                  color: Colors.grey.shade50,
                  size: 50,
                  controller: changepasscontroller.newpass,
                  borderColor: Colors.grey.shade300,
                  hint: "Enter New Password",
                  validator: MultiValidator([
                    // EmailValidator(
                    //   errorText: 'Please enter valid email',
                    // ),
                    RequiredValidator(errorText: 'New Password required')
                  ]),
                  // type: TextInputType.text,
                  icon: Icons.lock_outline,
                ),
                const SizedBox(height: 15),
                Text(
                  "Confirm Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                InputField(
                  color: Colors.grey.shade50,
                  size: 50,
                  borderColor: Colors.grey.shade300,
                  hint: "Enter Confirm Password",
                  controller: changepasscontroller.confirmpas,
                  // type: TextInputType.text,
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Confirm Password required')
                  ]),
                  icon: Icons.lock_outline,
                ),
                const SizedBox(height: 25),
                MyButton(
                  fontSize: 16,
                  title: changepasscontroller.isLoading.value
                      ? 'Please Wait...'
                      : "Submit",
                  fontWeight: FontWeight.w700,
                  textColor: Colors.white,
                  sizeHieght: 50,
                  onTap: () {
                    if (changepasscontroller.newpass.text ==
                        changepasscontroller.confirmpas.text) {
                      if (_formKey.currentState!.validate()) {
                        FocusScope.of(context).unfocus();
                        changepasscontroller.changepass(context);
                      }
                    } else {
                      snackbar(
                          context: context,
                          msg: 'Passwords does not matched',
                          title: 'Failed');
                    }
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
