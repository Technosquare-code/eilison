import 'package:elison/Components/FilterCategory.dart';
import 'package:elison/Components/MyButton2.dart';
import 'package:elison/controllers/customer/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/customer/products/main_screen_product_controller.dart';

class ProductFilterScreen extends StatefulWidget {
  static const routeName = "ProductFilterScreen";

  @override
  State<ProductFilterScreen> createState() => _ProductFilterScreenState();
}

class _ProductFilterScreenState extends State<ProductFilterScreen> {
  final homeController = Get.find<HomeScreenController>();

  final productController = Get.find<MainProductController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: MyButton2(
          iconSize: 18,
          fontSize: 16,
          elevation: 0,
          title: 'Filter',
          color: Colors.white,
          textColor: Colors.black,
          iconColor: Colors.black,
          sizeHieght: 25,
          image: 'assets/images/filter.png',
          fontWeight: FontWeight.w500,
          sizeWidth: size.width / 3.5,
        ),
        actions: [
          Center(
            child: InkWell(
              onTap: () {
                productController.clearAll();
                // setState(() {});
                Navigator.of(context).pop();
              },
              child: Text(
                "Clear All",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.black,
                  decorationThickness: 2,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(25, 5, 25, 60),
        child: Obx(() {
          return ListView.builder(
            itemCount: homeController.categoryList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, i) => FilterCategory(
                ischek: productController.filterList
                    .contains(homeController.categoryList[i].categoryName),
                img: homeController.categoryList[i].categoryIcon,
                title: homeController.categoryList[i].categoryName),
          );
        }),
      ),
      bottomSheet: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(color: Colors.grey),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  highlightColor: Colors.transparent,
                  onTap: () => Navigator.of(context).pop(),
                  child: SizedBox(
                    width: size.width / 2.5,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "CLOSE",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                        ),
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
                    productController.applyFilter();
                    Navigator.of(context).pop();
                  },
                  child: SizedBox(
                    width: size.width / 2.5,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "APPLY",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Divider(color: Colors.grey, height: 2),
          ],
        ),
      ),
    );
  }
}
