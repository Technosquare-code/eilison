import 'dart:math' as math;

import 'package:elison/Components/SelectCategory.dart';
import 'package:elison/Components/Sessions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/customer/home_screen_controller.dart';
import '../models/user_session_model.dart';

class AllSessionScreen extends StatefulWidget {
  bool isenrolled;
  String? title;
  List<UserSessionModel>? sessions;
  AllSessionScreen(
      {this.sessions = const [], this.isenrolled = false, this.title});
  @override
  State<AllSessionScreen> createState() => _AllSessionScreenState();
}

class _AllSessionScreenState extends State<AllSessionScreen> {
  final homescreenController = Get.find<HomeScreenController>();

  String selectedCategory = "0";
  // List categories = [
  //   'All',
  //   'Low Workout',
  //   'Hard Workout',
  //   'Lowerbody Workout',
  //   'Fullbody Workout',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
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
          widget.title ?? 'title',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(25, 15, 25, 10),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 10,
                children: List.generate(
                  homescreenController.sessionTypeList.length,
                  (index) => SelectCategory(
                    id: index.toString(),
                    title: homescreenController
                        .sessionTypeList[index].categoryName,
                    selected: selectedCategory,
                    onTap: () {
                      selectedCategory = index.toString();
                      setState(() {});

                      homescreenController.filterSessions(
                          homescreenController.sessionTypeList[index].id!,
                          widget.isenrolled);
                      ;
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Obx(() {
              if (widget.isenrolled) {
                // widget.sessions!.clear();
                widget.sessions =
                    homescreenController.seeAllEnrolledSessionList;
              } else {
                // widget.sessions!.clear();
                widget.sessions = homescreenController.seeAllOnlinSessionList;
              }
              return widget.sessions!.isEmpty
                  ? Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                        ),
                        Center(
                          child: Text('No data found'),
                        ),
                      ],
                    )
                  : ListView.builder(
                      itemCount: widget.sessions!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, i) {
                        if (i == 3) {
                          return Session(
                              coachId: widget.sessions![i].coachId,
                              isEnrolled: widget.isenrolled,
                              date: DateFormat('d MMM y')
                                  .format(widget.sessions![i].sessionDate),
                              duration: widget.sessions![i].duration,
                              img: widget.sessions![i].image,
                              time: widget.sessions![i].sessionTime,
                              title: widget.sessions![i].sessionName,
                              category: widget.sessions![i].sessionCategoryName,
                              showDivider: i != widget.sessions!.length - 1,
                              agenda: widget.sessions![i].agenda,
                              description: widget.sessions![i].description,
                              sessionId: widget.sessions![i].id,
                              sessiontype: widget.sessions![i].sessionType,
                              zoomlink: widget.sessions![i].zoomLink,
                              color: Colors.primaries[math.Random()
                                  .nextInt(Colors.primaries.length)],
                              is_joined:
                                  widget.sessions![i].is_joined ?? false);
                        } else {
                          return Session(
                              coachId: widget.sessions![i].coachId,
                              date: DateFormat('d MMM y')
                                  .format(widget.sessions![i].sessionDate),
                              duration: widget.sessions![i].duration,
                              img: widget.sessions![i].image,
                              time: widget.sessions![i].sessionTime,
                              title: widget.sessions![i].sessionName,
                              isEnrolled: widget.isenrolled,
                              category: widget.sessions![i].sessionCategoryName,
                              showDivider: i != widget.sessions!.length - 1,
                              agenda: widget.sessions![i].agenda,
                              description: widget.sessions![i].description,
                              sessionId: widget.sessions![i].id,
                              sessiontype: widget.sessions![i].sessionType,
                              zoomlink: widget.sessions![i].zoomLink,
                              color: Colors.primaries[math.Random()
                                  .nextInt(Colors.primaries.length)],
                              is_joined:
                                  widget.sessions![i].is_joined ?? false);
                        }
                      },
                    );
            }),
          ],
        ),
      ),
    );
  }
}
