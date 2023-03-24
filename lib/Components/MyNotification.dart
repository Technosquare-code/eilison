import 'package:flutter/material.dart';

class MyNotification extends StatelessWidget {
  final String image;
  final String title;
  final String time;

  const MyNotification({
    required this.image,
    required this.title,
    required this.time,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.pink.shade100,
              child: Image.asset(
                image,
                width: 30,
                height: 30,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(color: Colors.grey),
      ],
    );
  }
}
