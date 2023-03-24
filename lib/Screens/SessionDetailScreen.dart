import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class SessionDetailScreen extends StatelessWidget {
  static const routeName = "SessionDetailScreen";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(25, 25, 25, 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                "assets/images/session.PNG",
                width: size.width,
                height: size.height / 3.5,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "Online Session Name",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 25),
            Text(
              "Categories",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 15),
            ReadMoreText(
              'A jumping jack, also known as a star jump and called a side-straddle hop in the US military, is a physical jumping exercise performed by jumping to a position with the legs spread wide. A jumping jack, also known as a star jump and called a side-straddle hop in the US military, is a physical jumping exercise performed by jumping to a position with the legs spread.',
              trimLines: 4,
              delimiter: '  ',
              textAlign: TextAlign.justify,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Read More...',
              trimExpandedText: '',
              colorClickableText: primaryColor,
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
              ),
              moreStyle: TextStyle(
                fontSize: 12,
                color: primaryColor,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
        child: MyButton(
          fontSize: 16,
          sizeHieght: 50,
          title: "Enroll Now",
          textColor: Colors.white,
          onTap: () {},
        ),
      ),
    );
  }
}
