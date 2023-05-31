import 'package:elison/Utils/Colors.dart';
import 'package:elison/urls.dart';
import 'package:flutter/material.dart';

class Comments extends StatefulWidget {
  final String? id;
  final String? commentId;
  final String? commentText;
  final DateTime? createdDate;
  final String? name;
  final dynamic profilePicture;
  final Function()? comment;

  const Comments({
    this.comment,
    this.commentText,
    this.commentId,
    this.createdDate,
    this.id,
    this.name,
    this.profilePicture,
  });

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  timeDiff(DateTime comingDateTime) {
    // Current datetime
    DateTime currentDateTime = DateTime.now();

    // Another datetime (e.g., coming date)
    // DateTime comingDateTime = DateTime(2023, 5, 20, 12, 0, 0);

    // Calculate the difference
    Duration difference = currentDateTime.difference(comingDateTime);

    // Extract the difference in days, hours, and minutes
    int days = difference.inDays;
    int hours = difference.inHours;
    int minutes = difference.inMinutes;
    // print('object $difference');
    String differenceString;

    if (days > 0) {
      differenceString = '$days day ago';
    } else if (hours > 0) {
      differenceString = '$hours hr ago';
    } else if (minutes > 0) {
      differenceString = '$minutes min ago';
    } else {
      differenceString = 'Less than a minute';
    }

    // print('Difference: $differenceString');
    return differenceString;
  }

  bool liked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.profilePicture != null
              ? CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade100,
                  backgroundImage:
                      NetworkImage(mainUrl + imageUrl + widget.profilePicture),
                )
              : CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade100,
                  backgroundImage: AssetImage("assets/images/avatar.png"),
                ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text(
                  widget.name ?? "User",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  widget.commentText ?? "You are awesome. Keep going",
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      timeDiff(widget.createdDate!) ?? "Yesterday",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                            onTap: widget.comment,
                            child: Text(
                              "Reply",
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                        // InkWell(
                        //   onTap: widget.comment,
                        //   child: Icon(
                        //     Icons.messenger_outline,
                        //     color: Colors.black,
                        //     size: 15,
                        //   ),
                        // ),
                        // const SizedBox(width: 8),
                        // Text(
                        //   "1",
                        //   style: TextStyle(
                        //     fontSize: 10,
                        //     color: Colors.black,
                        //     fontFamily: "Poppins",
                        //     fontWeight: FontWeight.w600,
                        //   ),
                        // ),
                        // const SizedBox(width: 8),
                        // InkWell(
                        //   onTap: () {
                        //     liked = !liked;
                        //     setState(() {});
                        //   },
                        //   child: Icon(
                        //     liked ? Icons.favorite : Icons.favorite_border,
                        //     color: liked ? primaryColor : Colors.black,
                        //     size: 15,
                        //   ),
                        // ),
                      ],
                    )
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
