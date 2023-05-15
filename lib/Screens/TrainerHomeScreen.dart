import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Components/TrainerPastSessionList.dart';
import 'package:elison/Components/TrainerScheduleSessionList.dart';
import 'package:elison/Components/trainerSessionCard.dart';
import 'package:elison/Screens/AddSessionScreen.dart';
import 'package:elison/Screens/NotificationScreen.dart';
import 'package:elison/Screens/SessionDetailScreen.dart';
import 'package:elison/Screens/TrainerProfileScreen.dart';
import 'package:elison/Screens/TrainerProfileTab.dart';
import 'package:elison/Screens/TrainerSessionSeeAll.dart';
import 'package:elison/Screens/TrainerShimmer.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/controllers/customer/mainscreen_controller.dart';
import 'package:elison/controllers/trainer/session_detail_controller.dart';
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
  final detailController = Get.put(SessionDetailController());
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
        child: RefreshIndicator(
          onRefresh: () async {
            await mainscreenController.getuserdetails();
            await homepageController.getSessionList();
            await homepageController.pastSessionList();
            await homepageController.getOngoingList();
          },
          child: Obx(() {
            return Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: mainscreenController.isLoading.value ||
                        mainscreenController.userdetailList.isEmpty ||
                        homepageController.isLoading.value
                    ? TrainerHomeShimmer(
                        size: size,
                      )
                    : SingleChildScrollView(
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
                                            builder: (context) =>
                                                TrainerProfileTab(),
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
                                Text(
                                  'Upcoming Sessions',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                homepageController.sessionList.isNotEmpty
                                    ? InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    TrainerSessionSeeAll(
                                                  title: 'Upcoming Sessions',
                                                  sessionlist:
                                                      homepageController
                                                          .sessionList,
                                                ),
                                              ));
                                        },
                                        child: Text(
                                          'See All',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                            homepageController.sessionList.isEmpty
                                ? Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Center(
                                      child: Text('No data Found'),
                                    ),
                                  )
                                : SizedBox(
                                    height: 25,
                                  ),
                            homepageController.sessionList.isEmpty
                                ? Center()
                                : SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Wrap(
                                      spacing: 20,
                                      children: List.generate(
                                          homepageController
                                                      .sessionList.length >=
                                                  4
                                              ? 4
                                              : homepageController
                                                  .sessionList.length,
                                          (index) => InkWell(
                                                onTap: () {
                                                  detailController
                                                      .isUpcoming.value = true;
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            SessionDetailScreen(
                                                          sessionId:
                                                              homepageController
                                                                  .sessionList[
                                                                      index]
                                                                  .id,
                                                          description:
                                                              homepageController
                                                                  .sessionList[
                                                                      index]
                                                                  .description,
                                                          img:
                                                              homepageController
                                                                  .sessionList[
                                                                      index]
                                                                  .image,
                                                          title:
                                                              homepageController
                                                                  .sessionList[
                                                                      index]
                                                                  .sessionName,
                                                          isCoach: true,
                                                          agenda:
                                                              homepageController
                                                                  .sessionList[
                                                                      index]
                                                                  .agenda,
                                                          category:
                                                              homepageController
                                                                  .sessionList[
                                                                      index]
                                                                  .sessionCategoryName,
                                                          duration:
                                                              homepageController
                                                                  .sessionList[
                                                                      index]
                                                                  .duration,
                                                          sessiondate:
                                                              homepageController
                                                                  .sessionList[
                                                                      index]
                                                                  .sessionDate,
                                                          sessiontime:
                                                              homepageController
                                                                  .sessionList[
                                                                      index]
                                                                  .sessionTime,
                                                          sessiontype:
                                                              homepageController
                                                                  .sessionList[
                                                                      index]
                                                                  .sessionType,
                                                          zoomlink:
                                                              homepageController
                                                                  .sessionList[
                                                                      index]
                                                                  .zoomLink,
                                                        ),
                                                      ));
                                                },
                                                child: TrainerSessionCard(
                                                  isUpcoming: true,
                                                  categorytype:
                                                      homepageController
                                                          .sessionList[index]
                                                          .sessionCategoryName,
                                                  description:
                                                      homepageController
                                                          .sessionList[index]
                                                          .description,
                                                  title: homepageController
                                                      .sessionList[index]
                                                      .sessionName,
                                                  index: index,
                                                  img: homepageController
                                                      .sessionList[index].image,
                                                  startDate: homepageController
                                                      .sessionList[index]
                                                      .sessionDate,
                                                  duration: homepageController
                                                      .sessionList[index]
                                                      .duration,
                                                  startTime: homepageController
                                                      .sessionList[index]
                                                      .sessionTime,
                                                ),
                                              )),
                                    ),
                                  ),
                            homepageController.ongoingsessionList.isEmpty
                                ? Center()
                                : const SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Ongoing Sessions',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                homepageController.ongoingsessionList.isNotEmpty
                                    ? InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    TrainerSessionSeeAll(
                                                  title: 'Ongoing Sessions',
                                                  sessionlist:
                                                      homepageController
                                                          .ongoingsessionList,
                                                ),
                                              ));
                                        },
                                        child: Text(
                                          'See All',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                            homepageController.ongoingsessionList.isEmpty
                                ? Center()
                                : SizedBox(
                                    height: 25,
                                  ),
                            homepageController.ongoingsessionList.isEmpty
                                ? Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Center(
                                      child: Text('No data found'),
                                    ),
                                  )
                                : SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Wrap(
                                      spacing: 20,
                                      children: List.generate(
                                          homepageController.ongoingsessionList
                                                      .length >=
                                                  4
                                              ? 4
                                              : homepageController
                                                  .ongoingsessionList.length,
                                          (index) => InkWell(
                                                onTap: () {
                                                  detailController
                                                      .isUpcoming.value = false;
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            SessionDetailScreen(
                                                          sessionId:
                                                              homepageController
                                                                  .ongoingsessionList[
                                                                      index]
                                                                  .id,
                                                          description:
                                                              homepageController
                                                                  .ongoingsessionList[
                                                                      index]
                                                                  .description,
                                                          img: homepageController
                                                              .ongoingsessionList[
                                                                  index]
                                                              .image,
                                                          title: homepageController
                                                              .ongoingsessionList[
                                                                  index]
                                                              .sessionName,
                                                          isCoach: true,
                                                          agenda: homepageController
                                                              .ongoingsessionList[
                                                                  index]
                                                              .agenda,
                                                          category: homepageController
                                                              .ongoingsessionList[
                                                                  index]
                                                              .sessionCategoryName,
                                                          duration:
                                                              homepageController
                                                                  .ongoingsessionList[
                                                                      index]
                                                                  .duration,
                                                          sessiondate:
                                                              homepageController
                                                                  .ongoingsessionList[
                                                                      index]
                                                                  .sessionDate,
                                                          sessiontime:
                                                              homepageController
                                                                  .ongoingsessionList[
                                                                      index]
                                                                  .sessionTime,
                                                          sessiontype:
                                                              homepageController
                                                                  .ongoingsessionList[
                                                                      index]
                                                                  .sessionType,
                                                          zoomlink:
                                                              homepageController
                                                                  .ongoingsessionList[
                                                                      index]
                                                                  .zoomLink,
                                                        ),
                                                      ));
                                                },
                                                child: TrainerSessionCard(
                                                  categorytype:
                                                      homepageController
                                                          .ongoingsessionList[
                                                              index]
                                                          .sessionCategoryName,
                                                  description:
                                                      homepageController
                                                          .ongoingsessionList[
                                                              index]
                                                          .description,
                                                  title: homepageController
                                                      .ongoingsessionList[index]
                                                      .sessionName,
                                                  img: homepageController
                                                      .ongoingsessionList[index]
                                                      .image,
                                                  startDate: homepageController
                                                      .ongoingsessionList[index]
                                                      .sessionDate,
                                                  duration: homepageController
                                                      .ongoingsessionList[index]
                                                      .duration,
                                                  startTime: homepageController
                                                      .ongoingsessionList[index]
                                                      .sessionTime,
                                                ),
                                              )),
                                    ),
                                  ),
                            homepageController.pastsessionList.isEmpty
                                ? Center()
                                : const SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Past Sessions',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                homepageController.pastsessionList.isNotEmpty
                                    ? InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    TrainerSessionSeeAll(
                                                  title: 'Past Sessions',
                                                  sessionlist:
                                                      homepageController
                                                          .pastsessionList,
                                                ),
                                              ));
                                        },
                                        child: Text(
                                          'See All',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                            homepageController.pastsessionList.isEmpty
                                ? Center()
                                : SizedBox(
                                    height: 25,
                                  ),
                            homepageController.pastsessionList.isEmpty
                                ? Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Center(
                                      child: Text('No data found'),
                                    ),
                                  )
                                : Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 28.0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Wrap(
                                        spacing: 20,
                                        children: List.generate(
                                            homepageController.pastsessionList
                                                        .length >=
                                                    4
                                                ? 4
                                                : homepageController
                                                    .pastsessionList.length,
                                            (index) => InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              SessionDetailScreen(
                                                            sessionId:
                                                                homepageController
                                                                    .pastsessionList[
                                                                        index]
                                                                    .id,
                                                            isPast: true,
                                                            description:
                                                                homepageController
                                                                    .pastsessionList[
                                                                        index]
                                                                    .description,
                                                            img: homepageController
                                                                .pastsessionList[
                                                                    index]
                                                                .image,
                                                            title: homepageController
                                                                .pastsessionList[
                                                                    index]
                                                                .sessionName,
                                                            isCoach: true,
                                                            agenda: homepageController
                                                                .pastsessionList[
                                                                    index]
                                                                .agenda,
                                                            category: homepageController
                                                                .pastsessionList[
                                                                    index]
                                                                .sessionCategoryName,
                                                            duration:
                                                                homepageController
                                                                    .pastsessionList[
                                                                        index]
                                                                    .duration,
                                                            sessiondate:
                                                                homepageController
                                                                    .pastsessionList[
                                                                        index]
                                                                    .sessionDate,
                                                            sessiontime:
                                                                homepageController
                                                                    .pastsessionList[
                                                                        index]
                                                                    .sessionTime,
                                                            sessiontype:
                                                                homepageController
                                                                    .pastsessionList[
                                                                        index]
                                                                    .sessionType,
                                                            zoomlink:
                                                                homepageController
                                                                    .pastsessionList[
                                                                        index]
                                                                    .zoomLink,
                                                          ),
                                                        ));
                                                  },
                                                  child: TrainerSessionCard(
                                                    ispast: true,
                                                    categorytype:
                                                        homepageController
                                                            .pastsessionList[
                                                                index]
                                                            .sessionCategoryName,
                                                    description:
                                                        homepageController
                                                            .pastsessionList[
                                                                index]
                                                            .description,
                                                    title: homepageController
                                                        .pastsessionList[index]
                                                        .sessionName,
                                                    img: homepageController
                                                        .pastsessionList[index]
                                                        .image,
                                                    startDate:
                                                        homepageController
                                                            .pastsessionList[
                                                                index]
                                                            .sessionDate,
                                                    duration: homepageController
                                                        .pastsessionList[index]
                                                        .duration,
                                                    startTime:
                                                        homepageController
                                                            .pastsessionList[
                                                                index]
                                                            .sessionTime,
                                                  ),
                                                )),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
              ),
            );
          }),
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
