import 'package:elison/Components/Review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TrainerReviewScreen extends StatelessWidget {
  static const routeName = "TrainerReviewScreen";
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
            size: 20,
          ),
        ),
        title: Text(
          "Reviews",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Overal Rating",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RatingBar.builder(
                    initialRating: 5,
                    minRating: 1,
                    itemSize: 40,
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
                  const SizedBox(width: 10),
                  Text(
                    "5.0",
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
            const SizedBox(height: 15),
            Center(
              child: Text(
                "Based on 87 ratings",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              width: size.width,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade100,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  RatingItem(
                    rank: "Excellent",
                    value: 0.85,
                    color: Colors.green.shade800,
                    rate: "85",
                  ),
                  RatingItem(
                    rank: "Good",
                    value: 0,
                    color: Colors.orange.shade400,
                    rate: "0",
                  ),
                  RatingItem(
                    rank: "Average",
                    value: 0,
                    color: Colors.orange.shade800,
                    rate: "0",
                  ),
                  RatingItem(
                    rank: "Below Average",
                    value: 0.1,
                    color: Colors.orange.shade400,
                    rate: "1",
                  ),
                  RatingItem(
                    rank: "Poor",
                    value: 0,
                    color: Colors.yellow.shade800,
                    rate: "0",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            ListView.builder(
              itemCount: 6,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, i) => Review(),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingItem extends StatelessWidget {
  final String rank;
  final double value;
  final Color color;
  final String rate;

  const RatingItem({
    required this.rank,
    required this.value,
    required this.color,
    required this.rate,
  });
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Container(
            width: size.width / 4.5,
            alignment: Alignment.centerLeft,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                rank,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),
          SizedBox(
            width: size.width / 2,
            child: LinearProgressIndicator(
              value: value,
              color: Colors.grey.shade200,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                rate,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
