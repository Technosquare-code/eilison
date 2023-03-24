import 'package:elison/Components/InputFeild.dart';
import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Components/MyDropdown.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  static const routeName = "EditProfileScreen";
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String gender = "Male";
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
          ),
        ),
        title: Text(
          "Edit Profile",
          style: TextStyle(
            fontSize: 22,
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
            Center(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: secondaryColor,
                    backgroundImage: AssetImage("assets/images/profIcon.png"),
                  ),
                  Container(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.camera_fill,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
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
              "Gender",
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
              value: gender,
              items: ["Male", "Female"],
              title: ["Male", "Female"],
              color: Colors.grey.shade50,
              size: 45,
              width: size.width / 1.18,
              padding: 40,
              borderColor: Colors.grey.shade300,
              hint: "Select Gender",
              icon: Icons.account_circle,
              onChanged: (g) {
                gender = g.toString();
                setState(() {});
              },
            ),
            const SizedBox(height: 15),
            Text(
              "DOB",
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
              size: 50,
              color: Colors.grey.shade50,
              borderColor: Colors.grey.shade300,
              hint: "Select Date",
              type: TextInputType.number,
              icon: Icons.date_range,
            ),
            const SizedBox(height: 25),
            MyButton(
              fontSize: 16,
              title: "Update",
              fontWeight: FontWeight.w700,
              textColor: Colors.white,
              color: primaryColor,
              sizeHieght: 50,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
