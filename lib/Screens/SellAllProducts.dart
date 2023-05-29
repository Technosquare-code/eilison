import 'dart:math' as math;

import 'package:elison/Components/ProductCard.dart';
import 'package:elison/Components/SortProduct.dart';
import 'package:elison/Screens/ProductFilterScreen.dart';
import 'package:elison/Screens/WhishlistScreen.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/Utils/Utils.dart';
import 'package:elison/controllers/customer/products/show_products_controller.dart';
import 'package:elison/package%20edit/responsive_grid_list.dart';
import 'package:elison/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/customer/products/see_all_prodct_controller.dart';

class SeeAllProductScreen extends StatefulWidget {
  @override
  State<SeeAllProductScreen> createState() => _SeeAllProductScreenState();
}

class _SeeAllProductScreenState extends State<SeeAllProductScreen> {
  final productController =
      Get.put(SeeAllProductController(list: Get.arguments[0]));

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: true,
          title: Text(
            Get.arguments[1],
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ))),
      body: Obx(() {
        return productController.isLoading.value
            ? WishlistShimmer()
            : SingleChildScrollView(
                padding:
                    const EdgeInsets.only(bottom: 60, left: 5.0, right: 5.0),
                child: productController.productList.isEmpty
                    ? Container(
                        height: size.height * 0.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text('No Data Found'),
                            ),
                          ],
                        ),
                      )
                    : ResponsiveGridList(
                        shrinkWrap: true,
                        horizontalGridMargin: 5,
                        verticalGridMargin: 5,
                        minItemWidth: size.width / 2.5,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(
                          productController.productList.length,
                          (index) => ProductCard(
                            productId: productController.productList[index].id,
                            title:
                                productController.productList[index].itemName,
                            imagePath: mainUrl +
                                specialItemUrl +
                                productController.productList[index].thumbnail,
                            // "assets/images/laptop.png",
                            price: double.parse(
                                productController.productList[index].mrp),
                            color: colorList[index % colorList.length],
                            //  Colors
                            //     .primaries[math.Random()
                            //         .nextInt(Colors.primaries.length)]
                            //     .shade200,
                            onTap: () {
                              productController.wishlistmanaget(
                                  isAdd: !(productController
                                      .productList[index].isWhishlist),
                                  context: context,
                                  prod: productController.productList[index]);
                              setState(() {});
                            },
                            isFavourite: productController
                                .productList[index].isWhishlist,
                          ),
                        ),
                      ),
              );
      }),
    );
  }
}
