import 'dart:math' as math;

import 'package:elison/Components/ProductCard.dart';
import 'package:elison/Components/SortProduct.dart';
import 'package:elison/Screens/ProductFilterScreen.dart';
import 'package:elison/Utils/Utils.dart';
import 'package:elison/controllers/customer/products/show_products_controller.dart';
import 'package:elison/package%20edit/responsive_grid_list.dart';
import 'package:elison/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowProductScreen extends StatelessWidget {
  final productController = Get.put(
      ShowProductController(cat_id: Get.arguments[1], type: Get.arguments[0]));
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: true,
          title: Text(
            'Our Shop',
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
        return SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 60, left: 5.0, right: 5.0),
          child: productController.isLoading.value
              ? CircularProgressIndicator()
              : productController.productList.isEmpty
                  ? Center(
                      child: Text('No Data Found'),
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
                          title: productController.productList[index].itemName,
                          imagePath: mainUrl +
                              specialItemUrl +
                              productController.productList[index].thumbnail,
                          // "assets/images/laptop.png",
                          price: double.parse(
                              productController.productList[index].mrp),
                          color: Colors
                              .primaries[math.Random()
                                  .nextInt(Colors.primaries.length)]
                              .shade200,
                          onTap: () {
                            productController.wishlistmanaget(
                                isAdd: !(productController
                                    .productList[index].isWhishlist),
                                context: context,
                                prod: productController.productList[index]);
                          },
                          isFavourite:
                              productController.productList[index].isWhishlist,
                        ),
                      ),
                    ),
        );
      }),
      bottomSheet: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(color: Colors.grey, height: 2),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      ProductFilterScreen.routeName,
                    );
                  },
                  child: SizedBox(
                    width: size.width / 2.5,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ImageIcon(
                            AssetImage("assets/images/filter.png"),
                            color: Colors.black,
                            size: 15,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Filter",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border(left: BorderSide(color: Colors.grey)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Utils.showMyBottomSheet(context, SortProduct());
                  },
                  child: SizedBox(
                    width: size.width / 2.5,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ImageIcon(
                            AssetImage("assets/images/sort.png"),
                            color: Colors.black,
                            size: 15,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Sort",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
