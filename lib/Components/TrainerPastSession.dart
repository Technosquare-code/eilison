import 'package:flutter/material.dart';

class TrainerPastSession extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).pushNamed(
        //   SessionDetailScreen.routeName,
        // );
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
                    "Fullbody Workout",
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
    );
  }
}
