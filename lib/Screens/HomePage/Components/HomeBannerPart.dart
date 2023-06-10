import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:elison/controllers/customer/home_screen_controller.dart';
import 'package:elison/urls.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBannerPart extends StatelessWidget {
  final HomeScreenController homescreenController;

  const HomeBannerPart(this.homescreenController);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(
      () {
        return homescreenController.isBannerLoading.value
            ? FadeShimmer(
                radius: 15,
                width: size.width,
                height: size.height / 4,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              )
            : homescreenController.bannerList.isNotEmpty
                ? CarouselSlider(
                    items: homescreenController.bannerList.value[0].data
                        .map(
                          (item) => ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: InkWell(
                                onTap: () {},
                                child: CachedNetworkImage(
                                  imageUrl:
                                      mainUrl + bannerUrl + item.bannerImage,
                                  placeholder: (context, url) => Container(
                                    color: Colors.grey.shade200,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  height: 120,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                      height: size.height / 6,
                      viewportFraction: 1,
                      autoPlay: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  )
                : SizedBox(height: 25);
      },
    );
  }
}
