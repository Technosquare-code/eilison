import 'dart:math' as math;

import 'package:elison/Components/ProductCard.dart';
import 'package:elison/package%20edit/src/responsive_grid_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = "WishlistScreen";
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: ResponsiveGridList(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          minItemWidth: MediaQuery.of(context).size.width / 2.5,
          children: List.generate(
            6,
            (index) => ProductCard(
              title: "Huawei Matebook X 13",
              imagePath: "assets/images/laptop.png",
              price: 20999.00,
              color: Colors
                  .primaries[math.Random().nextInt(Colors.primaries.length)]
                  .shade200,
              onTap: () {},
              isFavourite: true,
            ),
          ),
        ),
      ),
    );
  }
}
