import 'package:elison/Components/ProductVideos.dart';
import 'package:elison/package%20edit/responsive_grid_list.dart';
import 'package:flutter/material.dart';

class ProductVideoScreen extends StatelessWidget {
  final List videos = [
    "assets/images/product.jpg",
    "assets/images/product1.PNG",
    "assets/images/product2.PNG",
    "assets/images/product3.PNG",
    "assets/images/foot_sap.jpeg",
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Our Videos",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(25, 5, 25, 25),
        child: ResponsiveGridList(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          minItemWidth: size.width / 2.5,
          children: List.generate(
            videos.length,
            (index) => ProductVideos(videos[index]),
          ),
        ),
      ),
    );
  }
}
