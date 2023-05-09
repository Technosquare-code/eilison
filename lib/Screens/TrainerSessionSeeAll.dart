import 'package:elison/Screens/WhishlistScreen.dart';
import 'package:flutter/material.dart';

import '../Components/trainerSessionCard.dart';
import '../models/session_list_model.dart';
import '../package edit/src/responsive_grid_list.dart';
import 'SessionDetailScreen.dart';

class TrainerSessionSeeAll extends StatelessWidget {
  String? title;
  List<SessionListModel> sessionlist;
  TrainerSessionSeeAll({super.key, this.sessionlist = const [], this.title});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Text(
          title ?? '',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: sessionlist.isEmpty
          ? Center(
              child: Text('Data Not Found'),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 60, left: 5.0, right: 5.0),
              child: ResponsiveGridList(
                shrinkWrap: true,
                horizontalGridMargin: 5,
                verticalGridMargin: 5,
                minItemWidth: size.width * 0.5,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  sessionlist.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SessionDetailScreen(
                                description: sessionlist[index].description,
                                img: sessionlist[index].image,
                                title: sessionlist[index].sessionName,
                                isCoach: true,
                                agenda: sessionlist[index].agenda,
                                category:
                                    sessionlist[index].sessionCategoryName,
                                duration: sessionlist[index].duration,
                                sessiondate: sessionlist[index].sessionDate,
                                sessiontime: sessionlist[index].sessionTime,
                                sessiontype: sessionlist[index].sessionType,
                                zoomlink: sessionlist[index].zoomLink,
                              ),
                            ));
                      },
                      child: TrainerSessionCard(
                        ispast: title == 'Past Sessions',
                        categorytype: sessionlist[index].sessionCategoryName,
                        description: sessionlist[index].description,
                        title: sessionlist[index].sessionName,
                        img: sessionlist[index].image,
                        startDate: sessionlist[index].sessionDate,
                        duration: sessionlist[index].duration,
                        startTime: sessionlist[index].sessionTime,
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
