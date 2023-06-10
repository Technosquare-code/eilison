import 'package:elison/Components/ProductCard.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/controllers/customer/home_screen_controller.dart';
import 'package:elison/urls.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDynamicPart extends StatelessWidget {
  final HomeScreenController homescreenController;

  const HomeDynamicPart(this.homescreenController);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() {
      return homescreenController.isDynamiceItemLoading.value
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
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
                const SizedBox(height: 25),
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
          : Column(
              children: homescreenController.dynamicItemList.map(
                (element) {
                  return Column(
                    children: [
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${element.category!.categoryName}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              int ii = homescreenController.i.value;

                              Get.toNamed('/see-All-products-screen',
                                  arguments: [
                                    element.productList,
                                    element.category!.categoryName
                                  ]);
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
                      element.productList!.length != 0 &&
                              homescreenController.lalal.value
                          ? SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: element.productList!.isNotEmpty
                                  ? Wrap(
                                      spacing: 16,
                                      children: List.generate(
                                        element.productList!.length,
                                        (index) => ProductCard(
                                          title: element
                                              .productList![index].itemName,
                                          productId:
                                              element.productList![index].id,
                                          imagePath: mainUrl +
                                              specialItemUrl +
                                              element.productList![index]
                                                  .thumbnail,
                                          price: double.parse(
                                              element.productList![index].mrp),
                                          color: colorList[
                                              index % colorList.length],
                                          onTap: () {
                                            homescreenController
                                                .wishlistmanagerfordynamic(
                                                    isAdd: !(element
                                                        .productList![index]
                                                        .isWhishlist),
                                                    context: context,
                                                    prod: element
                                                        .productList![index]);
                                            // setState(() {});
                                          },
                                          isFavourite: element
                                              .productList![index].isWhishlist,
                                        ),
                                      ),
                                    )
                                  : Container(),
                            )
                          : Container(),
                      const SizedBox(height: 15),
                    ],
                  );
                },
              ).toList(),
            );
    });
  }
}
