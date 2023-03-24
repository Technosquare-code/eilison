import 'package:elison/Components/InputFeild.dart';
import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Components/MyDropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewAddressScreen extends StatefulWidget {
  static const routeName = "AddNewAddressScreen";
  @override
  _AddNewAddressScreenState createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  String? state;
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
              borderColor: Colors.grey.shade300,
              hint: "Enter Name",
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
              hint: "Enter Phone",
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
              borderColor: Colors.grey.shade300,
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
              type: TextInputType.phone,
              icon: Icons.location_city,
            ),
            const SizedBox(height: 15),
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
            MyDropdown(
              value: state,
              items: ["Delhi", "Gorgaun"],
              title: ["Delhi", "Gorgaun"],
              color: Colors.grey.shade50,
              size: 45,
              width: size.width / 1.18,
              padding: 40,
              borderColor: Colors.grey.shade300,
              hint: "Select State",
              icon: Icons.my_location,
              onChanged: (s) {
                state = s.toString();
                setState(() {});
              },
            ),
            const SizedBox(height: 25),
            MyButton(
              fontSize: 16,
              title: "Save",
              fontWeight: FontWeight.w700,
              textColor: Colors.white,
              sizeHieght: 50,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
