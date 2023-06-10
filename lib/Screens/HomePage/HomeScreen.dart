import 'package:badges/badges.dart' as badges;
import 'package:elison/Components/shimmer/HomeShimmer.dart';
import 'package:elison/Screens/HomePage/Components/HomeBannerPart.dart';
import 'package:elison/Screens/HomePage/Components/HomeCategoryPart.dart';
import 'package:elison/Screens/HomePage/Components/HomeDynamicPart.dart';
import 'package:elison/Screens/HomePage/Components/HomeEnrolledSessionPart.dart';
import 'package:elison/Screens/HomePage/Components/HomeOnlineSessionPart.dart';
import 'package:elison/Screens/HomePage/Components/HomeSpecialItemPart.dart';
import 'package:elison/controllers/customer/home_screen_controller.dart';
import 'package:elison/controllers/customer/mainscreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/trainer/session_detail_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final mainscreenController = Get.find<MainScreenController>();
  final homescreenController = Get.put(HomeScreenController());
  final detailController = Get.put(SessionDetailController());

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            mainscreenController.isLoading(true);
            await mainscreenController.getuserdetails(context);
            mainscreenController.isLoading(false);
            homescreenController.startRefresh();
          },
          child: Obx(
            () {
              return mainscreenController.isLoading.value
                  ? HomeShimmer(size: size)
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(22),
                      child: Column(
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
                              mainscreenController.userdetailList.isNotEmpty
                                  ? mainscreenController
                                      .userdetailList[0].data.name
                                  : "",
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
                                badges.Badge(
                                  position: badges.BadgePosition.topEnd(
                                      top: 0, end: 0),
                                  badgeContent: Text(
                                    mainscreenController
                                            .userdetailList.isNotEmpty
                                        ? mainscreenController.userdetailList[0]
                                            .data.totalCartItems
                                        : '0',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 9),
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.shopping_cart_outlined,
                                      size: 22,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      Get.toNamed(
                                        '/cart',
                                        arguments: [false, 0, context],
                                      );
                                    },
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
                          HomeBannerPart(homescreenController),
                          const SizedBox(height: 25),
                          HomeCategoryPart(homescreenController),
                          const SizedBox(height: 15),
                          HomeSpecialItemPart(homescreenController),
                          HomeDynamicPart(homescreenController),
                          HomeOnlineSessionPart(homescreenController),
                          const SizedBox(height: 25),
                          HomeEnrolledSessionPart(homescreenController),
                        ],
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
