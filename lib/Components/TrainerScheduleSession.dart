import 'package:elison/Components/SessionOption.dart';
import 'package:elison/Utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrainerScheduleSession extends StatelessWidget {
  final String? title, img;
  const TrainerScheduleSession({super.key, this.img, this.title});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/session-detail-screen');
        // Navigator.of(context).pushNamed(
        //   SessionDetailScreen.routeName,
        // );
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
                        title ?? '',
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
                    ),
                    Image.asset(
                      'assets/images/session2.png',
                      width: 65,
                      height: 120,
                      fit: BoxFit.fill,
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
                Utils.showMyBottomSheet(context, SessionOption());
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
