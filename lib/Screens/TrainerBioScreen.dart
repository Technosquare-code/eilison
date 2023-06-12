import 'package:elison/Components/InputFeild.dart';
import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Screens/Trainer%20HomePage/TrainerHomeScreen.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:flutter/material.dart';

class TrainerBioScreen extends StatelessWidget {
  static const routeName = "TrainerBioScreen";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(25, 15, 25, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(
                    TrainerHomeScreen.routeName,
                  );
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height / 10),
              Text(
                "YOUR BIO",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15),
              InputField(
                size: 30,
                minLine: 10,
                maxLine: 10,
                borderRadius: 10,
                color: Colors.white,
                hint: "Enter Your Bio",
                borderColor: Colors.grey,
              ),
              const SizedBox(height: 25),
              MyButton(
                title: "Save",
                fontSize: 14,
                sizeHieght: 50,
                color: primaryColor,
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(
                    TrainerHomeScreen.routeName,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
