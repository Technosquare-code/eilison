import 'package:elison/Components/FeaturedCArd.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/controllers/customer/home_screen_controller.dart';
import 'package:elison/urls.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeSpecialItemPart extends StatelessWidget {
  final HomeScreenController homescreenController;

  const HomeSpecialItemPart(this.homescreenController);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(
      () {
        return homescreenController.isSpecialItemLoading.value
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeShimmer(
                    height: 8,
                    radius: 15,
                    width: size.width / 4,
                    baseColor: Colors.grey.shade500,
                    highlightColor: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FadeShimmer(
                        radius: 15,
                        height: size.width / 3,
                        width: size.width / 2.4,
                        baseColor: Colors.grey.shade500,
                        highlightColor: Colors.grey.shade300,
                      ),
                      FadeShimmer(
                        radius: 15,
                        height: size.width / 3,
                        width: size.width / 2.4,
                        baseColor: Colors.grey.shade500,
                        highlightColor: Colors.grey.shade300,
                      ),
                    ],
                  ),
                ],
              )
            : homescreenController.specialItemList.isEmpty
                ? Container()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Special Deals For You',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(
                                '/see-All-products-screen',
                                arguments: [
                                  homescreenController.specialItemList,
                                  'Special Deals For You'
                                ],
                              );
                            },
                            child: Text(
                              'See All',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      homescreenController.specialItemList.isEmpty
                          ? Container()
                          : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Wrap(
                                spacing: 16,
                                children: List.generate(
                                  homescreenController.specialItemList.length >=
                                          6
                                      ? 6
                                      : homescreenController
                                          .specialItemList.length,
                                  (index) => FeaturedCard(
                                    isFavourite: homescreenController
                                        .specialItemList[index].isWhishlist,
                                    id: homescreenController
                                        .specialItemList[index].id,
                                    title: homescreenController
                                        .specialItemList[index].itemName,
                                    imagePath: mainUrl +
                                        specialItemUrl +
                                        homescreenController
                                            .specialItemList[index].thumbnail,
                                    price: double.parse(homescreenController
                                        .specialItemList[index].mrp),
                                    color: colorList[index % colorList.length],
                                    onTap: () {
                                      homescreenController.wishlistmanaget(
                                          isAdd: !(homescreenController
                                              .specialItemList[index]
                                              .isWhishlist),
                                          context: context,
                                          prod: homescreenController
                                              .specialItemList[index]);
                                      // setState(() {});
                                    },
                                  ),
                                ),
                              ),
                            ),
                    ],
                  );
      },
    );
  }
}
