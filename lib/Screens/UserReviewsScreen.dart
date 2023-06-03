import 'package:elison/Components/Review.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../controllers/customer/profile/myReviews/reviews_controller.dart';

class UserReviewScreen extends StatelessWidget {
  static const routeName = "UserReviewScreen";
  final myReviewsController = Get.put(MyReviewsController());
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
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Obx(() {
        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              myReviewsController.isLoading.value
                  ? shimmerCard(context)
                  : myReviewsController.reviewsList.isEmpty
                      ? Center(
                          child: Text("No data found"),
                        )
                      : ListView.builder(
                          itemCount: myReviewsController.reviewsList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (ctx, i) => Review(
                            createdDate:
                                myReviewsController.reviewsList[i].createdDate,
                            name: myReviewsController.reviewsList[i].name,
                            profilePicture: myReviewsController
                                .reviewsList[i].profilePicture,
                            rating: myReviewsController.reviewsList[i].rating,
                            review: myReviewsController.reviewsList[i].review,
                          ),
                        ),
            ],
          ),
        );
      }),
    );
  }
}

Widget shimmerCard(BuildContext context) {
  Size size = MediaQuery.of(context).size;
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
              FadeShimmer(
                width: 50,
                height: 50,
                radius: 15,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeShimmer(
                      width: double.infinity,
                      height: 12,
                      radius: 15,
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 5),
                    FadeShimmer(
                      width: double.infinity,
                      height: 10,
                      radius: 15,
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.grey.shade300,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Container(
            width: double.infinity,
            height: 10,
            color: Colors.white,
          ),
        ],
      ),
    ),
  );
}
