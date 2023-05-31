import 'dart:math' as math;

import 'package:elison/Components/ProductCard.dart';
import 'package:elison/Components/shimmer/ItemListLoading.dart';
import 'package:elison/controllers/customer/profile/wishlist/wishlist_controller.dart';
import 'package:elison/package%20edit/src/responsive_grid_list.dart';
import 'package:elison/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import 'NoDataFoundScreen.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = "WishlistScreen";
  final wishController = Get.put(WishlistController());
  @override
  Widget build(BuildContext context) {
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
          ),
        ),
        title: Text(
          "Wishlist",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Obx(() {
        return wishController.isLoading.value
            ? ItemListLoading()
            : wishController.wishList.isEmpty
                ? NoDataFound(
                    buttnText: 'Continue Shopping',
                    img: 'assets/images/empty_wishlist.png',
                    // 'https://www.pinclipart.com/picdir/middle/573-5735512_com-herz-kontur-rot-empty-heart-icon-png.png',
                    title: 'Wishlist is Empty',
                  )
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(8),
                    child: ResponsiveGridList(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      minItemWidth: MediaQuery.of(context).size.width / 2.5,
                      children: List.generate(
                        wishController.wishList.length,
                        (index) => ProductCard(
                          productId: wishController.wishList[index].productId,
                          title: wishController.wishList[index].itemName,
                          imagePath: mainUrl +
                              specialItemUrl +
                              wishController.wishList[index].thumbnail,
                          price: double.parse(
                              wishController.wishList[index].sellingPrice),
                          color: Colors
                              .primaries[math.Random()
                                  .nextInt(Colors.primaries.length)]
                              .shade200,
                          onTap: () {
                            wishController.wishlistmanager(
                                isAdd: false,
                                context: context,
                                prod: wishController.wishList[index]);
                          },
                          isFavourite: true,
                        ),
                      ),
                    ),
                  );
      }),
    );
  }
}

class WishlistShimmer extends StatelessWidget {
  const WishlistShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              // SizedBox(width: 16.0),
              Spacer(),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      itemCount: 5,
    );
  }
}
