import 'dart:math' as math;

import 'package:elison/Components/Sessions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySessionScreen extends StatelessWidget {
  static const routeName = "MySessionScreen";
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
            size: 20,
          ),
        ),
        title: Text(
          "My Sessions",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(25, 15, 10, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'OnGoing Sessions',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            Session(
              showDivider: true,
              color: Colors
                  .primaries[math.Random().nextInt(Colors.primaries.length)],
            ),
            Session(
              showDivider: false,
              color: Colors
                  .primaries[math.Random().nextInt(Colors.primaries.length)],
            ),
            const SizedBox(height: 25),
            Text(
              'UpComing Sessions',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            Session(
              showDivider: true,
              color: Colors
                  .primaries[math.Random().nextInt(Colors.primaries.length)],
            ),
            Session(
              showDivider: false,
              color: Colors
                  .primaries[math.Random().nextInt(Colors.primaries.length)],
            ),
            const SizedBox(height: 25),
            Text(
              'Completed Sessions',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            Session(
              showDivider: true,
              color: Colors
                  .primaries[math.Random().nextInt(Colors.primaries.length)],
            ),
            Session(
              showDivider: false,
              color: Colors
                  .primaries[math.Random().nextInt(Colors.primaries.length)],
            ),
          ],
        ),
      ),
    );
  }
}
