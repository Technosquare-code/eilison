import 'package:elison/Components/SessionOption.dart';
import 'package:elison/Screens/SessionDetailScreen.dart';
import 'package:elison/Utils/Utils.dart';
import 'package:elison/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrainerScheduleSession extends StatelessWidget {
  final String? sessionName,
      img,
      description,
      agenda,
      sessiontype,
      sessiondate,
      sessiontime,
      duration,
      zoomlink,
      category;
  final int? index;
  const TrainerScheduleSession(
      {super.key,
      this.img,
      this.sessionName,
      this.description,
      this.index,
      this.agenda,
      this.category,
      this.duration,
      this.sessiondate,
      this.sessiontime,
      this.sessiontype,
      this.zoomlink});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.toNamed('/session-detail-screen');
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SessionDetailScreen(
                description: description,
                img: img,
                title: sessionName,
                isCoach: true,
                agenda: agenda,
                category: category,
                duration: duration,
                sessiondate: sessiondate,
                sessiontime: sessiontime,
                sessiontype: sessiontype,
                zoomlink: zoomlink,
              ),
            ));
      },
      child: Stack(
        children: [
          Container(
            height: 130,
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.pink.shade100,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sessionName ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.pink.shade50,
                      backgroundImage: NetworkImage(
                        mainUrl + sessionUrl + img!,
                        // 'assets/images/session2.png',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 5,
            right: 0,
            child: IconButton(
              onPressed: () {
                Utils.showMyBottomSheet(context, SessionOption(index: index));
              },
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
