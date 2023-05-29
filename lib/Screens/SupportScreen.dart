import 'package:elison/Components/InputFeild.dart';
import 'package:elison/Components/MyButtton.dart';
import 'package:elison/controllers/customer/profile/support/add_support_controller.dart';
import 'package:elison/controllers/customer/profile/support/support_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class SupportScreen extends StatelessWidget {
  static const routeName = "SupportScreen";
  final _formKey = GlobalKey<FormState>();
  final spcontroller = Get.put(AddSupportController());
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
          "Support",
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Send us message",
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
                  "Full Name",
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
                  hint: "Enter Your Name",
                  controller: spcontroller.name,
                  validator: MultiValidator([
                    // EmailValidator(
                    //   errorText: 'Please enter valid email',
                    // ),
                    RequiredValidator(errorText: 'Full Name required')
                  ]),
                  type: TextInputType.name,
                  icon: Icons.person,
                ),
                const SizedBox(height: 15),
                Text(
                  "Phone",
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
                  hint: "Enter Your Phone",
                  controller: spcontroller.phoneNo,
                  validator: MultiValidator([
                    LengthRangeValidator(
                        min: 10, max: 15, errorText: 'Length range 10-15'),
                    RequiredValidator(errorText: 'Phone Number required')
                  ]),
                  type: TextInputType.phone,
                  icon: Icons.phone_android,
                ),
                const SizedBox(height: 15),
                Text(
                  "Email Address",
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
                  hint: "Enter Your Email",
                  controller: spcontroller.email,
                  type: TextInputType.emailAddress,
                  validator: MultiValidator([
                    EmailValidator(
                      errorText: 'Please enter valid email',
                    ),
                    RequiredValidator(errorText: 'Email required')
                  ]),
                  icon: Icons.mail,
                ),
                const SizedBox(height: 15),
                Text(
                  "Message",
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
                  minLine: 8,
                  maxLine: 8,
                  borderRadius: 18,
                  color: Colors.grey.shade50,
                  borderColor: Colors.grey.shade300,
                  hint: "Enter Your Message",
                  controller: spcontroller.msg,
                  type: TextInputType.name,
                  validator: MultiValidator([
                    // EmailValidator(
                    //   errorText: 'Please enter valid email',
                    // ),
                    RequiredValidator(errorText: 'Message required')
                  ]),
                ),
                const SizedBox(height: 25),
                MyButton(
                  fontSize: 16,
                  title: spcontroller.isLoading.value
                      ? 'Please Wait...'
                      : "Submit",
                  fontWeight: FontWeight.w700,
                  textColor: Colors.white,
                  sizeHieght: 50,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus();
                      spcontroller.addsupposrtmsg(context, '');
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
