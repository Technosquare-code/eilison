import 'package:elison/Components/InputFeild.dart';
import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Components/MyDropdown.dart';
import 'package:elison/controllers/customer/profile/address/add_address_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class AddNewAddressScreen extends StatefulWidget {
  static const routeName = "AddNewAddressScreen";
  @override
  _AddNewAddressScreenState createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  // bool args = Get.arguments;
  String? state;
  final _formKey = GlobalKey<FormState>();

  final addressController = Get.put(
      AddAddressController(isAdd: Get.arguments[0], index: Get.arguments[1]));
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
          "Add New Address",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Obx(() {
          return Form(
            key: _formKey,
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
                  color: Colors.grey.shade50,
                  size: 50,
                  controller: addressController.name,
                  validator: MultiValidator([
                    // EmailValidator(
                    //   errorText: 'Please enter valid email',
                    // ),
                    RequiredValidator(errorText: 'Full Name required')
                  ]),
                  borderColor: Colors.grey.shade300,
                  hint: "Enter Name",
                  type: TextInputType.name,
                  icon: Icons.person,
                ),
                const SizedBox(height: 15),
                Text(
                  "Email",
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
                  hint: "Enter Email",
                  controller: addressController.email,
                  validator: MultiValidator(
                      [RequiredValidator(errorText: 'Email required')]),
                  type: TextInputType.emailAddress,
                  icon: Icons.email_sharp,
                ),
                const SizedBox(height: 15),
                // const SizedBox(height: 15),
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
                  hint: "Enter Phone",
                  controller: addressController.phoneNo,
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
                  "Alternate No.",
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
                  validator: MultiValidator([
                    LengthRangeValidator(
                        min: 10, max: 15, errorText: 'Length range 10-15')
                  ]),
                  borderColor: Colors.grey.shade300,
                  controller: addressController.alternateNo,
                  hint: "Enter Alternate No. (Optional)",
                  type: TextInputType.phone,
                  icon: Icons.phone_iphone,
                ),
                const SizedBox(height: 15),
                Text(
                  "Pincode",
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
                  controller: addressController.pincode,
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Pincode required'),
                    RangeValidator(
                        min: 6, max: 6, errorText: '6 digits required')
                  ]),
                  hint: "Enter Pincode",
                  type: TextInputType.number,
                  icon: Icons.donut_small,
                ),
                const SizedBox(height: 15),
                Text(
                  "Address",
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
                  hint: "Enter Address",
                  controller: addressController.address,
                  validator: MultiValidator(
                      [RequiredValidator(errorText: 'Address required')]),
                  type: TextInputType.streetAddress,
                  icon: Icons.map,
                ),
                const SizedBox(height: 15),
                Text(
                  "Landmark",
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
                  controller: addressController.landmark,
                  borderColor: Colors.grey.shade300,
                  hint: "Enter Landmark (Optional)",
                  type: TextInputType.name,
                  icon: Icons.place,
                ),
                const SizedBox(height: 15),
                Text(
                  "Locality / Town",
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
                    hint: "Enter Locality / Town",
                    type: TextInputType.name,
                    controller: addressController.locality,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Locality/Town required')
                    ]),
                    icon: Icons.apartment),
                const SizedBox(height: 15),
                Text(
                  "City",
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
                  hint: "Enter City",
                  controller: addressController.city,
                  validator: MultiValidator(
                      [RequiredValidator(errorText: 'City required')]),
                  type: TextInputType.text,
                  icon: Icons.location_city,
                ),
                const SizedBox(height: 15),
                // const SizedBox(height: 15),
                Text(
                  "State",
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
                  hint: "Enter State",
                  controller: addressController.state,
                  validator: MultiValidator(
                      [RequiredValidator(errorText: 'State required')]),
                  type: TextInputType.text,
                  icon: Icons.my_location,
                ),
                // const SizedBox(height: 15),
                // Text(
                //   "State",
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontSize: 15,
                //     color: Colors.black,
                //     fontFamily: "Poppins",
                //     fontWeight: FontWeight.w500,
                //   ),
                // ),
                // const SizedBox(height: 5),
                // MyDropdown(
                //   value: state,
                //   items: ["Delhi", "Gorgaun"],
                //   title: ["Delhi", "Gorgaun"],
                //   color: Colors.grey.shade50,
                //   size: 45,
                //   width: size.width / 1.18,
                //   padding: 40,
                //   borderColor: Colors.grey.shade300,
                //   hint: "Select State",
                //   icon: Icons.my_location,
                //   onChanged: (s) {
                //     state = s.toString();
                //     setState(() {});
                //   },
                // ),
                const SizedBox(height: 25),
                MyButton(
                  fontSize: 16,
                  title: addressController.isLoading.value
                      ? 'Please Wait...'
                      : addressController.isAdd!
                          ? "Save"
                          : 'Update',
                  fontWeight: FontWeight.w700,
                  textColor: Colors.white,
                  sizeHieght: 50,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus();
                      addressController.addEditAddress(context);
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
