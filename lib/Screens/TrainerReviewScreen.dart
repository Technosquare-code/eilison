import 'package:elison/Components/Review.dart';
import 'package:elison/Components/shimmer/addressShimmer.dart';
import 'package:elison/controllers/review_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class TrainerReviewScreen extends StatelessWidget {
  static const routeName = "TrainerReviewScreen";
  final reviewController =
      Get.put(ReviewController(trainerid: Get.arguments[0]));
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() {
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
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: reviewController.isLoading.value
            ? AddressShimmer(size: size)
            : reviewController.ratinglist.isEmpty
                ? Text('data not found')
                : SingleChildScrollView(
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
                                initialRating:
                                    reviewController.avg_rating.value,
                                minRating: 1,
                                itemSize: 40,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                ignoreGestures: true,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 0.5),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (_) {},
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "${reviewController.avg_rating.value.toStringAsFixed(2)}",
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
                            reviewController.totalratings.value == 1
                                ? "Based on ${reviewController.totalratings.value} rating"
                                : "Based on ${reviewController.totalratings.value} ratings",
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
                                value: reviewController.fiveStar.value,
                                color: Colors.green.shade800,
                                rate: reviewController.fiveStar.value
                                    .round()
                                    .toString(),
                              ),
                              RatingItem(
                                rank: "Good",
                                value: reviewController.fourStar.value,
                                color: Colors.orange.shade400,
                                rate: reviewController.fourStar.value
                                    .round()
                                    .toString(),
                              ),
                              RatingItem(
                                rank: "Average",
                                value: reviewController.threeStar.value,
                                color: Colors.orange.shade800,
                                rate:
                                    "${reviewController.threeStar.value.round()}",
                              ),
                              RatingItem(
                                rank: "Below Average",
                                value: reviewController.twoStar.value,
                                color: Colors.orange.shade400,
                                rate:
                                    "${reviewController.twoStar.value.round()}",
                              ),
                              RatingItem(
                                rank: "Poor",
                                value: reviewController.oneStar.value,
                                color: Colors.yellow.shade800,
                                rate:
                                    "${reviewController.oneStar.value.round()}",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        ListView.builder(
                          itemCount: reviewController.ratinglist.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (ctx, i) => Review(
                            name: reviewController.ratinglist[i].name,
                            profilePicture:
                                reviewController.ratinglist[i].profilePicture,
                            rating: reviewController.ratinglist[i].rating,
                            review: reviewController.ratinglist[i].review,
                            createdDate:
                                reviewController.ratinglist[i].createdDate,
                          ),
                        ),
                      ],
                    ),
                  ),
      );
    });
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
