import 'package:elison/urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Review extends StatelessWidget {
  final String? name;
  final String? profilePicture;
  final String? rating;
  final String? review;
  final DateTime? createdDate;
  Review(
      {this.name,
      this.profilePicture,
      this.rating,
      this.review,
      this.createdDate});
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
    print('object $difference');
    String differenceString;

    if (days > 0) {
      differenceString = '$days d';
    } else if (hours > 0) {
      differenceString = '$hours hr';
    } else if (minutes > 0) {
      differenceString = '$minutes min';
    } else {
      differenceString = 'Less than a minute';
    }

    // print('Difference: $differenceString');
    return differenceString;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: profilePicture != null && profilePicture != ''
                      ? Image.network(
                          mainUrl + imageUrl + profilePicture!,
                          width: 50,
                          height: 50,
                          fit: BoxFit.fill,
                        )
                      : Image.network(
                          // "assets/images/product1.PNG",
                          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.fill,
                        ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          name ?? "Prachi yogi",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            rating ?? "5.0",
                            style: TextStyle(
                              fontSize: 8,
                              color: Colors.black,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 3),
                          RatingBar.builder(
                            initialRating: double.parse(rating ?? '1'),
                            minRating: 1,
                            itemSize: 10,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            ignoreGestures: true,
                            itemPadding: EdgeInsets.symmetric(horizontal: 0.5),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (_) {},
                          ),
                          const SizedBox(width: 3),
                          Text(
                            timeDiff(createdDate ?? DateTime.now()),
                            style: TextStyle(
                              fontSize: 8,
                              color: Colors.black,
                              fontFamily: "Poppins",
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
            const SizedBox(height: 5),
            Text(
              review ??
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ",
              style: TextStyle(
                fontSize: 10,
                color: Colors.black,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
