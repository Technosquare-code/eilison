import 'package:elison/Screens/LoginScreen.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnBoardScreen extends StatefulWidget {
  static const routeName = "OnBoardScreen";
  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int current = 0;
  double progress = 0.34;
  final List<Map<String, dynamic>> onBoards = [
    {
      'image': 'assets/images/continue1.png',
      'title': 'Join Sessions',
      'subTitle':
          'Don\'t worry if you have trouble determining your goals, We can help you determine your goals and track your goals',
    },
    {
      'image': 'assets/images/continue2.png',
      'title': 'Buy Your Product',
      'subTitle':
          'Let\'s start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun',
    },
    {
      'image': 'assets/images/continue3.png',
      'title': 'Improve your\nstrength',
      'subTitle':
          'Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning',
    },
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              onBoards[current]['image'],
              width: size.width,
              height: size.height / 1.8,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    onBoards[current]['title'],
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    onBoards[current]['subTitle'],
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 65,
            width: 65,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              value: progress,
              color: Colors.white,
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
            ),
          ),
          FloatingActionButton(
            elevation: 0,
            backgroundColor: secondaryColor,
            onPressed: () {
              if (current < 2) {
                current++;
                progress += 0.34;
                setState(() {});
              } else {
                Navigator.of(context).pushNamed(LoginScreen.routeName);
              }
            },
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
