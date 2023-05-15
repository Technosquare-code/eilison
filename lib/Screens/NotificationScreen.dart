import 'package:elison/Components/MyNotification.dart';
import 'package:elison/controllers/customer/home_screen_controller.dart';
import 'package:elison/controllers/notification_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Components/shimmer/addressShimmer.dart';
import 'NoDataFoundScreen.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = "NotificationScreen";
  final notificationController = Get.put(NotificationController());
  // final List<Map<String, dynamic>> notifications = [
  //   {
  //     'image': 'assets/images/not1.png',
  //     'title': 'Hey, Wecome !! Account Created',
  //     'time': 'About 1 minutes ago',
  //   },
  //   {
  //     'image': 'assets/images/not2.png',
  //     'title': 'Order Placed Successfully',
  //     'time': 'About 3 hours ago',
  //   },
  //   {
  //     'image': 'assets/images/not3.png',
  //     'title': 'You are Enrolled in Session !!',
  //     'time': 'About 3 hours ago',
  //   },
  // ];
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
          ),
        ),
        title: Text(
          "Notifications",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Obx(() {
        return notificationController.isLoading.value
            ? AddressShimmer(
                size: MediaQuery.of(context).size,
              )
            : notificationController.notificationList.isEmpty
                ? NoDataFound(
                    buttnText: 'No Notification',
                    img: 'assets/images/empty_notification.png',
                    // 'https://cdn-icons-png.flaticon.com/512/3541/3541850.png',
                    title: 'No Notifications Right Now',
                  )
                : SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(25, 10, 25, 25),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: notificationController.notificationList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, i) => MyNotification(
                          image: 'assets/images/xlogo.png',
                          title: notificationController
                              .notificationList[i].notiTitle,
                          subtitle: notificationController
                              .notificationList[i].notiDescription,
                          time: DateFormat('d MMM y h:mm a').format(
                              notificationController
                                  .notificationList[i].createdDate)),
                    ),
                  );
      }),
    );
  }
}
