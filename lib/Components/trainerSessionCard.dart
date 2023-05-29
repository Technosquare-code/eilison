import 'package:elison/Components/SessionOption.dart';
import 'package:elison/urls.dart';
import 'package:flutter/material.dart';

import '../Utils/Utils.dart';

class TrainerSessionCard extends StatelessWidget {
  bool? ispast, isUpcoming;
  int? index;
  String? title, img, description, categorytype, duration, startDate, startTime;
  TrainerSessionCard(
      {super.key,
      this.img,
      this.index,
      this.ispast = false,
      this.isUpcoming = false,
      this.description,
      this.title,
      this.categorytype,
      this.duration,
      this.startDate,
      this.startTime});
  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DateTime date = DateTime.parse(startDate!);
    String formattedDate =
        "${date.day}${_getDaySuffix(date.day)} ${_getMonthName(date.month).substring(0, 3)} ${date.year.toString().substring(2)}";
    // print(formattedDate); // output: "23rd May 23"

    return Container(
      width: size.width * 0.65,
      height: size.height * 0.22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        // color: Colors.amber,
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                  mainUrl + sessionUrl + img!,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ispast!
              ? Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white54),
                )
              : Container(),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                categorytype ?? '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          isUpcoming!
              ? Positioned(
                  top: 2,
                  right: 0,
                  child: IconButton(
                    onPressed: () {
                      Utils.showMyBottomSheet(
                          context, SessionOption(index: index));
                    },
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                )
              : Container(),
          Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      formattedDate,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        width: 2,
                        height: 15,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      startTime ?? '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        width: 2,
                        height: 15,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '$duration min',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
