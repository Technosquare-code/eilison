import 'package:elison/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final sp = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    // Timer(const Duration(seconds: 3), () => Get.offAndToNamed('/on-boarding'));
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              child: Image.asset('assets/images/splash_logo.png'),
            )
          ],
        ),
      )),
    );
  }
}
