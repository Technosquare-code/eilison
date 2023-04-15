import 'dart:math' as math;

import 'package:elison/Components/ProductCard.dart';
import 'package:elison/package%20edit/src/responsive_grid_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllCategoryProductScreen extends StatefulWidget {
  static const routeName = "AllCategoryProductScreen";
  @override
  State<AllCategoryProductScreen> createState() =>
      _AllCategoryProductScreenState();
}

class _AllCategoryProductScreenState extends State<AllCategoryProductScreen> {
  late String title;

  @override
  void didChangeDependencies() {
    title = ModalRoute.of(context)!.settings.arguments.toString();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
          title,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ResponsiveGridList(
        shrinkWrap: true,
        horizontalGridMargin: 15,
        verticalGridMargin: 15,
        minItemWidth: size.width / 2.5,
        children: List.generate(
          8,
          (index) => ProductCard(
            productId: '',
            title: "Huawei Matebook X 13",
            imagePath: "assets/images/laptop.png",
            price: 20999.00,
            color: Colors
                .primaries[math.Random().nextInt(Colors.primaries.length)]
                .shade200,
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
