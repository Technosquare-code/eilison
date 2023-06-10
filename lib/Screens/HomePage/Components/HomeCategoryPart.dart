import 'package:elison/Components/HomeCategory.dart';
import 'package:elison/controllers/customer/home_screen_controller.dart';
import 'package:elison/urls.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCategoryPart extends StatelessWidget {
  final HomeScreenController homeScreenController;

  const HomeCategoryPart(this.homeScreenController);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(
      () {
        return homeScreenController.isCategoryListLoading.value
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 15,
                      children: List.generate(
                        5,
                        (index) => FadeShimmer(
                          radius: 15,
                          height: size.width / 4,
                          width: size.width / 4,
                          baseColor: Colors.grey.shade500,
                          highlightColor: Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed('/category-screen');
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
                  homeScreenController.categoryList.isNotEmpty
                      ? SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            spacing: 6,
                            children: List.generate(
                              homeScreenController.categoryList.length,
                              (index) => HomeCategory(
                                imageAsset: mainUrl +
                                    categoryUrl +
                                    homeScreenController
                                        .categoryList[index].categoryIcon,
                                title: homeScreenController
                                    .categoryList[index].categoryName,
                                onTap: () {
                                  print('object');
                                  Get.toNamed('/show-products-screen',
                                      arguments: [
                                        'category',
                                        homeScreenController
                                            .categoryList[index].id,
                                        homeScreenController
                                            .categoryList[index].categoryName
                                      ]);
                                },
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              );
      },
    );
  }
}
