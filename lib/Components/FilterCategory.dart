import 'package:elison/Utils/Colors.dart';
import 'package:elison/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/customer/home_screen_controller.dart';
import '../controllers/customer/products/main_screen_product_controller.dart';

class FilterCategory extends StatefulWidget {
  final String? img, title;
  final bool ischek;
  FilterCategory({this.img, this.title, this.ischek = false});
  @override
  _FilterCategoryState createState() => _FilterCategoryState();
}

class _FilterCategoryState extends State<FilterCategory> {
  bool isCheck = false;
  final productController = Get.find<MainProductController>();
  @override
  void initState() {
    // TODO: implement initState
    isCheck = widget.ischek;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade400, width: 0.8),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        dense: true,
        leading: Image.network(
          mainUrl + categoryUrl + widget.img!,
          // "assets/images/category.png",
          width: 50,
          height: 40,
          fit: BoxFit.fill,
        ),
        title: Text(
          // "Resistance Band",
          widget.title!,
          style: TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Checkbox(
          value: isCheck,
          onChanged: (s) {
            isCheck = s!;

            isCheck
                ? productController.filterList.add(widget.title)
                : productController.filterList.remove(widget.title);
            setState(() {});
            print(productController.filterList);
          },
          activeColor: primaryColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.blueGrey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
