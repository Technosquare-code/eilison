import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Screens/OnBoardScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class GettingStartScreen extends StatefulWidget {
  @override
  State<GettingStartScreen> createState() => _GettingStartScreenState();
}

class _GettingStartScreenState extends State<GettingStartScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Image.asset(
              "assets/images/eilison_logo.png",
              width: size.width / 1.3,
              height: size.height / 4,
              fit: BoxFit.fill,
            ),
            MyButton(
              title: "Get Started",
              fontSize: 14,
              sizeHieght: 50,
              onTap: () {
                Get.toNamed('/onboard-screen');
                // Navigator.of(context).pushNamed(OnBoardScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
