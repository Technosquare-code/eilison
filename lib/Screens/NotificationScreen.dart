import 'package:elison/Components/MyNotification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = "NotificationScreen";
  final List<Map<String, dynamic>> notifications = [
    {
      'image': 'assets/images/not1.png',
      'title': 'Hey, Wecome !! Account Created',
      'time': 'About 1 minutes ago',
    },
    {
      'image': 'assets/images/not2.png',
      'title': 'Order Placed Successfully',
      'time': 'About 3 hours ago',
    },
    {
      'image': 'assets/images/not3.png',
      'title': 'You are Enrolled in Session !!',
      'time': 'About 3 hours ago',
    },
  ];
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 25),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: notifications.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, i) => MyNotification(
            image: notifications[i]['image'],
            title: notifications[i]['title'],
            time: notifications[i]['time'],
          ),
        ),
      ),
    );
  }
}
