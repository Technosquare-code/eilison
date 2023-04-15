import 'dart:math' as math;

import 'package:elison/Components/ProductCard.dart';
import 'package:elison/controllers/customer/profile/wishlist/wishlist_controller.dart';
import 'package:elison/package%20edit/src/responsive_grid_list.dart';
import 'package:elison/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          "Whishlist",
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
            ? CircularProgressIndicator()
            : wishController.wishList.isEmpty
                ? Center(
                    child: Text('No Data Found'),
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
