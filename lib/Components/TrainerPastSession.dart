import 'package:cached_network_image/cached_network_image.dart';
import 'package:elison/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Screens/SessionDetailScreen.dart';

class TrainerPastSession extends StatelessWidget {
  String? title, img, description;
  TrainerPastSession({this.img, this.title, this.description});
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
                title: title,
                isCoach: true,
              ),
            ));
      },
      child: Container(
        height: 130,
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // "Fullbody Workout",'
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
                  backgroundColor: Colors.grey.shade50,
                ),
                img != ''
                    ? CachedNetworkImage(
                        imageUrl: mainUrl + sessionUrl + img!,
                        // 'assets/images/session2.png',
                        width: 65,
                        height: 120,
                        fit: BoxFit.fill,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      )
                    // Image.network(
                    //     mainUrl + sessionUrl + img!,
                    //     // 'assets/images/session2.png',
                    //     width: 65,
                    //     height: 120,
                    //     fit: BoxFit.fill,
                    //   )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
