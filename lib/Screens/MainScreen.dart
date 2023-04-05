import 'package:elison/Screens/CartScreen.dart';
import 'package:elison/Screens/CategoryScreen.dart';
import 'package:elison/Screens/CommunityScreen.dart';
import 'package:elison/Screens/HomeScreen.dart';
import 'package:elison/Screens/ProductListScreen.dart';
import 'package:elison/Screens/ProductVideosScreen.dart';
import 'package:elison/Screens/ProfileScreen.dart';
import 'package:elison/Screens/WhishlistScreen.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/controllers/customer/mainscreen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  static const routeName = "MainScreen";
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPage = 0;
  final List<Map<String, dynamic>> tabs = [
    {"title": ".", "icon": "assets/images/home.png"},
    {"title": ".", "icon": "assets/images/messenger.png"},
    {"title": ".", "icon": "assets/images/camera.png"},
    {"title": ".", "icon": "assets/images/person.png"},
  ];
  final mainscreenController = Get.put(MainScreenController());
  final List pages = [
    HomeScreen(),
    // CategoryScreen(),
    CommunityScreen(),
    // CartScreen(),
    ProductListScreen(),
    ProductVideoScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: pages[currentPage],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        transform: Matrix4.translationValues(0, 15, 0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              offset: Offset(0.5, 0),
              color: Colors.white,
            ),
            BoxShadow(
              blurRadius: 1,
              offset: Offset(0, 0.5),
              color: Colors.white,
            ),
          ],
        ),
        child: FloatingActionButton(
          heroTag: "btn1",
          onPressed: () {
            currentPage = 2;
            setState(() {});
          },
          splashColor: Colors.white,
          backgroundColor: primaryColor,
          child: Icon(
            CupertinoIcons.bag,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          elevation: 10,
          selectedFontSize: 10,
          showSelectedLabels: false,
          unselectedFontSize: 10,
          showUnselectedLabels: false,
          currentIndex: currentPage,
          backgroundColor: secondaryColor,
          iconSize: 25,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.blueGrey,
          type: BottomNavigationBarType.fixed,
          onTap: (page) {
            if (page != 2) {
              currentPage = page;
              setState(() {});
            }
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: secondaryColor,
              icon: ImageIcon(AssetImage(tabs[0]['icon'])),
              label: tabs[0]['title'],
            ),
            BottomNavigationBarItem(
              backgroundColor: secondaryColor,
              icon: ImageIcon(AssetImage(tabs[1]['icon'])),
              label: tabs[1]['title'],
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(
                CupertinoIcons.bag,
                color: secondaryColor,
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: secondaryColor,
              icon: ImageIcon(AssetImage(tabs[2]['icon'])),
              label: tabs[2]['title'],
            ),
            BottomNavigationBarItem(
              backgroundColor: secondaryColor,
              icon: ImageIcon(AssetImage(tabs[3]['icon'])),
              label: tabs[3]['title'],
            ),
          ],
        ),
      ),
    );
  }
}
