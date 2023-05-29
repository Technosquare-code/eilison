import 'dart:math' as math;

import 'package:elison/Components/ProductCard.dart';
import 'package:elison/Components/SortProduct.dart';
import 'package:elison/Components/shimmer/ItemListLoading.dart';
import 'package:elison/Screens/ProductFilterScreen.dart';
import 'package:elison/Screens/WhishlistScreen.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/Utils/Utils.dart';
import 'package:elison/controllers/customer/products/main_screen_product_controller.dart';
import 'package:elison/package%20edit/responsive_grid_list.dart';
import 'package:elison/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final mainssproductController = Get.put(MainProductController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            'Our Shop',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: mainssproductController.isLoading.value
            ? ItemListLoading()
            : mainssproductController.productList.isEmpty
                ? Center(
                    child: Text('Data Not Found'),
                  )
                : SingleChildScrollView(
                    padding: const EdgeInsets.only(
                        bottom: 60, left: 5.0, right: 5.0),
                    child: ResponsiveGridList(
                      shrinkWrap: true,
                      horizontalGridMargin: 5,
                      verticalGridMargin: 5,
                      minItemWidth: size.width / 2.5,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(
                        mainssproductController.productList.length,
                        (index) => ProductCard(
                          isFavourite: mainssproductController
                              .productList[index].isWhishlist,
                          productId:
                              mainssproductController.productList[index].id,
                          title: mainssproductController
                              .productList[index].itemName,
                          imagePath: mainUrl +
                              specialItemUrl +
                              mainssproductController
                                  .productList[index].thumbnail,
                          price: double.parse(
                              mainssproductController.productList[index].mrp),
                          color: colorList[index % colorList.length],
                          // color: Colors
                          //     .primaries[math.Random()
                          //         .nextInt(Colors.primaries.length)]
                          // .shade200,
                          onTap: () {
                            mainssproductController.wishlistmanaget(
                                isAdd: !(mainssproductController
                                    .productList[index].isWhishlist),
                                context: context,
                                prod:
                                    mainssproductController.productList[index]);
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                  ),
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
                      Get.toNamed('/product-filter-screen');
                      // Navigator.of(context).pushNamed(
                      //   ProductFilterScreen.routeName,
                      // );
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
    });
  }
}
