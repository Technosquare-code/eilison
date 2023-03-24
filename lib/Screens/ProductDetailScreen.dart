import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Components/product_more_image.dart';
import 'package:elison/Screens/PromocodeScreen.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../Components/HomeCategory.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = "ProductDetailScreen";
  final List<Map<String, dynamic>> cardList = [
    {
      'imageAsset': 'assets/images/product1.PNG',
      'title': 'Resistance Band',
    },
    {
      'imageAsset': 'assets/images/product2.PNG',
      'title': 'Resistance Band',
    },
    {
      'imageAsset': 'assets/images/product3.PNG',
      'title': 'Resistance Band',
    },
    {
      'imageAsset': 'assets/images/product1.PNG',
      'title': 'Resistance Band',
    },
    {
      'imageAsset': 'assets/images/product2.PNG',
      'title': 'Resistance Band',
    },
    {
      'imageAsset': 'assets/images/product3.PNG',
      'title': 'Resistance Band',
    },


    // Add more cards as needed.
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      "assets/images/product1.jpeg",
                      width: size.width,
                      height: size.height / 3.0,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      top: 15,
                      left: 15,
                      child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      transform: Matrix4.translationValues(0, -20, 0),
                      padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                "Resistance Band",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              subtitle: Text(
                                "Product Category",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              trailing: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(7),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 1),
                                      color: Colors.grey.shade100,
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                    ),
                                    BoxShadow(
                                      offset: Offset(1, 0),
                                      color: Colors.grey.shade100,
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.favorite,
                                  color: primaryColor,
                                  size: 15,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  "\$ 19,999",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: primaryColor,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Text(
                                  "\$ 20,000",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: primaryColor,
                                    decorationThickness: 2,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Text(
                              "Description",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 15),
                            ReadMoreText(
                              'Pancakes are some people\'s favorite breakfast, who doesn\'t like pancakes? Especially with the real honey splash on top of the pancakes, of course everyone loves that! besides being. Pancakes are some people\'s favorite breakfast, who doesn\'t like pancakes? Especially with the real honey splash on top of the pancakes, of course everyone loves that! besides being.',
                              trimLines: 4,
                              delimiter: '  ',
                              textAlign: TextAlign.justify,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'Read More...',
                              trimExpandedText: '',
                              colorClickableText: primaryColor,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                              ),
                              moreStyle: TextStyle(
                                fontSize: 12,
                                color: primaryColor,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 25),
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 1),
                                    color: Colors.grey.shade200,
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                  ),
                                  BoxShadow(
                                    offset: Offset(1, 0),
                                    color: Colors.grey.shade200,
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: ListTile(
                                leading: Image.asset(
                                  "assets/images/not3.png",
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.fill,
                                ),
                                title: Center(
                                  child: Text(
                                    "Product manual",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                trailing: Icon(
                                  CupertinoIcons.chevron_down_circle,
                                  size: 20,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                            const SizedBox(height: 25),
                            Text(
                              "Product Video",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 15),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset(
                                "assets/images/session.PNG",
                                width: size.width,
                                height: size.height / 5,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(height: 55),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Transform(
                        transform: Matrix4.translationValues(0, -60, 0),
                        child: SizedBox(
                          width: size.width / 1.2,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Wrap(
                              spacing: 0,
                              children: List.generate(
                                cardList.length,
                                    (index) => productmoreimage(
                                  imageAsset: cardList[index]['imageAsset'],
                                  title: cardList[index]['title'],
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Transform(
                    //   transform: Matrix4.translationValues(
                    //     0,
                    //     -((size.width / 4) + 10),
                    //     0,
                    //   ),
                    //   child: SizedBox(
                    //     width: size.width / 1.2,
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //       children: [
                    //         ClipRRect(
                    //           borderRadius: BorderRadius.circular(15),
                    //           child: Image.asset(
                    //             "assets/images/product1.PNG",
                    //             width: size.width / 4,
                    //             height: size.width / 4,
                    //             fit: BoxFit.fill,
                    //           ),
                    //         ),
                    //         ClipRRect(
                    //           borderRadius: BorderRadius.circular(15),
                    //           child: Image.asset(
                    //             "assets/images/product2.PNG",
                    //             width: size.width / 4,
                    //             height: size.width / 4,
                    //             fit: BoxFit.fill,
                    //           ),
                    //         ),
                    //         ClipRRect(
                    //           borderRadius: BorderRadius.circular(15),
                    //           child: Image.asset(
                    //             "assets/images/product3.PNG",
                    //             width: size.width / 4,
                    //             height: size.width / 4,
                    //             fit: BoxFit.fill,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0,bottom: 8.0),
                child: MyButton(
                  fontSize: 16,
                  sizeHieght: 55,
                  title: "Add to cart",
                  textColor: Colors.white,
                  onTap: () {
                    // Navigator.of(context).pushNamed(
                    //   PromocodeScreen.routeName,
                    // );
                  },
                ),
              ),
            ),
      ],
        ),
      ),
    );
  }
}
