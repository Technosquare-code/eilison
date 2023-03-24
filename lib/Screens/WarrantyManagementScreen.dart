import 'package:elison/Components/InputFeild.dart';
import 'package:elison/Components/MyButtton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WarrantyManagementScreen extends StatelessWidget {
  static const routeName = "WarrantyManagementScreen";
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
            fontSize: 16,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 15),
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
              color: Colors.grey.shade50,
              size: 50,
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
              color: Colors.grey.shade50,
              size: 50,
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
              borderColor: Colors.grey.shade300,
              hint: "Enter Order ID",
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
              color: Colors.grey.shade50,
              size: 50,
              borderColor: Colors.grey.shade300,
              hint: "Enter Delivery Date",
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
              borderColor: Colors.grey.shade300,
              hint: "Enter Platform Name",
              type: TextInputType.name,
              icon: Icons.pages,
            ),
            const SizedBox(height: 25),
            MyButton(
              fontSize: 16,
              title: "Submit",
              fontWeight: FontWeight.w700,
              textColor: Colors.white,
              sizeHieght: 50,
              onTap: () {},
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
