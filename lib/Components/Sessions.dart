import 'dart:math' as math;
import 'dart:math';

import 'package:elison/Screens/SessionDetailScreen.dart';
import 'package:flutter/material.dart';

class Session extends StatelessWidget {
  final bool showDivider;
  final Color color;

  Session({
    required this.showDivider,
    required this.color,
  });
  final Random _random = Random();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SessionDetailScreen(),
                  ));
            },
            child: Container(
              margin: const EdgeInsets.only(right: 25),
              transform: Matrix4.translationValues(25, 0, 0),
              child: Card(
                elevation: 2,
                // color: color,
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadiusDirectional.only(
                //     topStart: Radius.circular(35),
                //     bottomStart: Radius.circular(35),
                //   ),
                // ),
                child: Row(
                  children: [
                    Transform(
                      transform: Matrix4.translationValues(-35, 0, 0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 43,
                            backgroundColor: color,
                          ),
                          CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage("assets/images/product1.PNG"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Transform(
                        transform: Matrix4.translationValues(-35, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Lower Body Workout",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Container(
                                  transform:
                                      Matrix4.translationValues(25, 0, 0),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Colors
                                        .primaries[_random
                                            .nextInt(Colors.primaries.length)]
                                        .shade300,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    "45 Minutes",
                                    style: TextStyle(
                                      fontSize: 9,
                                      color: Colors.white,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Hard Workout",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Time: 08:30 am",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "Date: 2023-03-23",
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
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (showDivider)
            Container(
              width: 1,
              height: 30,
              transform: Matrix4.translationValues(40, 0, 0),
              decoration: BoxDecoration(
                border: Border(left: BorderSide(color: Colors.grey)),
              ),
            ),
        ],
      ),
    );
  }
}
