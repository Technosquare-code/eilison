import 'package:elison/Components/InputFeild.dart';
import 'package:elison/Components/MyButtton.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

import '../controllers/customer/profile/support/add_support_controller.dart';

class Help extends StatelessWidget {
  final String? orderId;
  Help({this.orderId});
  final spcontroller = Get.put(AddSupportController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 15, 25, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 12,
                width: size.width / 6,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "Send message us",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 15),
            InputField(
              size: 30,
              hint: "Enter Name",
              borderRadius: 10,
              controller: spcontroller.name,
              validator: MultiValidator([
                // EmailValidator(
                //   errorText: 'Please enter valid email',
                // ),
                RequiredValidator(errorText: 'Full Name required')
              ]),
              type: TextInputType.name,
              color: Colors.grey.shade50,
              borderColor: Colors.grey.shade300,
            ),
            const SizedBox(height: 15),
            InputField(
              size: 30,
              hint: "Enter Phone",
              borderRadius: 10,
              controller: spcontroller.phoneNo,
              validator: MultiValidator([
                LengthRangeValidator(
                    min: 10, max: 15, errorText: 'Length range 10-15'),
                RequiredValidator(errorText: 'Phone Number required')
              ]),
              type: TextInputType.phone,
              color: Colors.grey.shade50,
              borderColor: Colors.grey.shade300,
            ),
            const SizedBox(height: 15),
            InputField(
              size: 30,
              borderRadius: 10,
              hint: "Enter Email",
              controller: spcontroller.email,
              type: TextInputType.emailAddress,
              validator: MultiValidator([
                EmailValidator(
                  errorText: 'Please enter valid email',
                ),
                RequiredValidator(errorText: 'Email required')
              ]),
              color: Colors.grey.shade50,
              borderColor: Colors.grey.shade300,
            ),
            const SizedBox(height: 15),
            InputField(
              size: 30,
              minLine: 8,
              maxLine: 8,
              borderRadius: 10,
              hint: "Enter Message",
              controller: spcontroller.msg,
              type: TextInputType.name,
              validator: MultiValidator([
                // EmailValidator(
                //   errorText: 'Please enter valid email',
                // ),
                RequiredValidator(errorText: 'Message required')
              ]),
              borderColor: Colors.grey.shade300,
              color: Colors.grey.shade50,
            ),
            const SizedBox(height: 25),
            MyButton(
              fontSize: 16,
              title: spcontroller.isLoading.value ? 'Please Wait...' : "Submit",
              fontWeight: FontWeight.w700,
              textColor: Colors.white,
              sizeHieght: 50,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  FocusScope.of(context).unfocus();
                  spcontroller.addsupposrtmsg(context, orderId ?? '');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
