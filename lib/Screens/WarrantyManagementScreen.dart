import 'package:elison/Components/InputFeild.dart';
import 'package:elison/Components/MyButtton.dart';
import 'package:elison/controllers/customer/profile/warrenty/warrenty_details_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class WarrantyManagementScreen extends StatelessWidget {
  static const routeName = "WarrantyManagementScreen";
  final warrentyController = Get.put(WarrentyController());
  final _formKey = GlobalKey<FormState>();

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
          "Extended Warranty Management",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
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
                  validator: MultiValidator([
                    // EmailValidator(
                    //   errorText: 'Please enter valid email',
                    // ),
                    RequiredValidator(errorText: 'Full Name required')
                  ]),
                  controller: warrentyController.name,
                  color: Colors.grey.shade50,
                  size: 50,
                  borderColor: Colors.grey.shade300,
                  hint: "Enter Your Name",
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
                  validator: MultiValidator([
                    LengthRangeValidator(
                        min: 10, max: 15, errorText: 'Length range 10-15'),
                    RequiredValidator(errorText: 'Phone Number required')
                  ]),
                  controller: warrentyController.phoneNo,
                  color: Colors.grey.shade50,
                  size: 50,
                  borderColor: Colors.grey.shade300,
                  hint: "Enter Your Phone",
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
                  controller: warrentyController.email,
                  color: Colors.grey.shade50,
                  size: 50,
                  validator: MultiValidator([
                    EmailValidator(
                      errorText: 'Please enter valid email',
                    ),
                    RequiredValidator(errorText: 'Email required')
                  ]),
                  borderColor: Colors.grey.shade300,
                  hint: "Enter Your Email",
                  type: TextInputType.emailAddress,
                  icon: Icons.mail,
                ),
                const SizedBox(height: 15),
                Text(
                  "Product Name",
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
                  controller: warrentyController.productName,
                  color: Colors.grey.shade50,
                  size: 50,
                  validator: MultiValidator([
                    // EmailValidator(
                    //   errorText: 'Please enter valid email',
                    // ),
                    RequiredValidator(errorText: 'Product Name required')
                  ]),
                  borderColor: Colors.grey.shade300,
                  hint: "Enter Product Name",
                  type: TextInputType.name,
                  icon: Icons.layers,
                ),
                const SizedBox(height: 15),
                Text(
                  "Order ID",
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
                  controller: warrentyController.orderId,
                  borderColor: Colors.grey.shade300,
                  hint: "Enter Order ID",
                  validator: MultiValidator([
                    // EmailValidator(
                    //   errorText: 'Please enter valid email',
                    // ),
                    RequiredValidator(errorText: 'OrderID required')
                  ]),
                  type: TextInputType.visiblePassword,
                  icon: Icons.receipt,
                ),
                const SizedBox(height: 15),
                Text(
                  "Delivey Date",
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
                  readOnly: true,
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (selectedDate != null) {
                      String formattedDate =
                          '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
                      warrentyController.deliverydate.text = formattedDate;
                    }
                  },
                  color: Colors.grey.shade50,
                  size: 50,
                  controller: warrentyController.deliverydate,
                  borderColor: Colors.grey.shade300,
                  hint: "Enter Delivery Date",
                  validator: MultiValidator([
                    // EmailValidator(
                    //   errorText: 'Please enter valid email',
                    // ),
                    RequiredValidator(errorText: 'Delivery Date required')
                  ]),
                  type: TextInputType.datetime,
                  icon: Icons.date_range,
                ),
                const SizedBox(height: 15),
                Text(
                  "Platform Name",
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
                  controller: warrentyController.platformName,
                  borderColor: Colors.grey.shade300,
                  hint: "Enter Platform Name",
                  type: TextInputType.name,
                  validator: MultiValidator([
                    // EmailValidator(
                    //   errorText: 'Please enter valid email',
                    // ),
                    RequiredValidator(errorText: 'Platform Name required')
                  ]),
                  icon: Icons.pages,
                ),
                const SizedBox(height: 25),
                MyButton(
                  fontSize: 16,
                  title: warrentyController.isLoading.value
                      ? 'Please wait...'
                      : "Submit",
                  fontWeight: FontWeight.w700,
                  textColor: Colors.white,
                  sizeHieght: 50,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      warrentyController.addsWarrentyDetails(context);
                    }
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
          );
        }),
      ),
    );
  }
}
