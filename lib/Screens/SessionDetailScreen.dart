import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Components/RateTrainer.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class SessionDetailScreen extends StatelessWidget {
  bool? isCoach;
  String? img,
      title,
      description,
      agenda,
      sessiontype,
      sessiondate,
      sessiontime,
      duration,
      zoomlink,
      category;
  SessionDetailScreen(
      {this.description,
      this.img,
      this.title,
      this.isCoach,
      this.agenda,
      this.category,
      this.duration,
      this.sessiondate,
      this.sessiontime,
      this.sessiontype,
      this.zoomlink});
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
              child: Image.network(
                mainUrl + sessionUrl + img!,
                // "assets/images/session.PNG",
                width: size.width,
                height: size.height / 3.5,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  // "Online Session Name",
                  title ?? '',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                isCoach!
                    ? Container()
                    : InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              content: RateTrainer(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 13,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "Rate",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ],
            ),
            Text(
              '${sessiondate}  (${sessiontime})',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              'Duration- ${duration}',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Text(
                  category ?? '',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () async {
                    if (await canLaunch(zoomlink!)) {
                      await launch(zoomlink!);
                    }
                  },
                  child: Text(
                    'Join Link',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              'Agenda- ${agenda}',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 15),
            ReadMoreText(
              description ?? '',
              // 'A jumping jack, also known as a star jump and called a side-straddle hop in the US military, is a physical jumping exercise performed by jumping to a position with the legs spread wide. A jumping jack, also known as a star jump and called a side-straddle hop in the US military, is a physical jumping exercise performed by jumping to a position with the legs spread.',
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
      bottomSheet: isCoach!
          ? Container(
              height: 0,
            )
          : Container(
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
