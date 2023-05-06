import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Components/TrainerPastSessionList.dart';
import 'package:elison/Components/TrainerScheduleSessionList.dart';
import 'package:elison/Screens/AddSessionScreen.dart';
import 'package:elison/Screens/NotificationScreen.dart';
import 'package:elison/Screens/TrainerProfileScreen.dart';
import 'package:elison/Screens/TrainerProfileTab.dart';
import 'package:elison/Screens/TrainerShimmer.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/controllers/customer/mainscreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../controllers/trainer/train_home_ctrl.dart';

class TrainerHomeScreen extends StatefulWidget {
  static const routeName = "TrainerHomeScreen";
  @override
  _TrainerHomeScreenState createState() => _TrainerHomeScreenState();
}

class _TrainerHomeScreenState extends State<TrainerHomeScreen> {
  final mainscreenController = Get.put(MainScreenController());
  final homepageController = Get.put(TrainerHomeController());

  int selectedIndex = 0;
  List pages = [
    TrainerScheduleSessionList(),
    TrainerPastSessionList(),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return Padding(
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
            child: mainscreenController.isLoading.value ||
                    mainscreenController.userdetailList.isEmpty ||
                    homepageController.isLoading.value
                ? TrainerHomeShimmer(
                    size: size,
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome Back",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                        subtitle: Text(
                          // "Manoj Saini",
                          mainscreenController.userdetailList.isEmpty
                              ? ''
                              : mainscreenController
                                  .userdetailList[0].data.name,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              constraints: BoxConstraints(
                                maxWidth: 35,
                                minWidth: 35,
                                maxHeight: 35,
                                minHeight: 35,
                              ),
                              onPressed: () {
                                // Get.toNamed('/trainer-profile-screen');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TrainerProfileTab(),
                                    ));
                              },
                              icon: Icon(
                                Icons.person_outline,
                                color: Colors.black,
                                size: 22,
                              ),
                            ),
                            IconButton(
                              constraints: BoxConstraints(
                                maxWidth: 35,
                                minWidth: 35,
                                maxHeight: 35,
                                minHeight: 35,
                              ),
                              onPressed: () {
                                Get.toNamed('/notification');
                                // Navigator.of(context).pushNamed(
                                //   NotificationScreen.routeName,
                                // );
                              },
                              icon: Image.asset(
                                "assets/images/notification.png",
                                width: 30,
                                height: 30,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyButton(
                            title: 'Scheduled Sessions',
                            sizeWidth: size.width / 2.5,
                            color: selectedIndex == 0
                                ? primaryColor
                                : secondaryColor,
                            fontSize: 14,
                            onTap: () {
                              selectedIndex = 0;

                              homepageController.getSessionList();
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: 'Past Sessions',
                            sizeWidth: size.width / 2.5,
                            color: selectedIndex == 1
                                ? primaryColor
                                : secondaryColor,
                            fontSize: 14,
                            onTap: () {
                              selectedIndex = 1;
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Expanded(child: pages[selectedIndex]),
                    ],
                  ),
          );
        }),
      ),
      floatingActionButton: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 65,
            width: 65,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              value: 100,
              color: Colors.white,
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
            ),
          ),
          FloatingActionButton(
            elevation: 0,
            backgroundColor: secondaryColor,
            onPressed: () {
              Get.toNamed('/add-session', arguments: [false, 0]);
              // Navigator.of(context).pushNamed(AddSessionScreen.routeName);
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
