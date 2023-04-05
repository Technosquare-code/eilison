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
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 25),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: videos.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, i) => ProductVideos(videos[i]),
        ),
      ),
    );
  }
}
