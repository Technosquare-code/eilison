import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Screens/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CongratulationScreen extends StatelessWidget {
  static const routeName = "CongratulationScreen";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Lottie.asset(
                "assets/lottie/congrats.json",
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 30),
              Text(
                "Congratulations, Your\nOrder has been Placed !!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Thanks for choosing us !!",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Expanded(child: SizedBox()),
              MyButton(
                fontSize: 16,
                sizeHieght: 55,
                title: "Back To Home",
                textColor: Colors.white,
                onTap: () {
                  Get.offAllNamed('/user-home');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
