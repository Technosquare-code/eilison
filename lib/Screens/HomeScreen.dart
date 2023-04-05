import 'dart:math' as math;
import 'dart:math';
import 'package:badges/badges.dart' as badges;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:elison/Components/HomeCategory.dart';
import 'package:elison/Components/ProductCard.dart';
import 'package:elison/Components/Sessions.dart';
import 'package:elison/Screens/AllCategoryProductScreen.dart';
import 'package:elison/Screens/AllSessionScreen.dart';
import 'package:elison/Screens/CartScreen.dart';
import 'package:elison/Screens/CategoryScreen.dart';
import 'package:elison/Screens/NotificationScreen.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/package%20edit/src/responsive_grid_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../Components/FeaturedCArd.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Random _random = Random();
  final List<Map<String, dynamic>> cardList = [
    {
      'imageAsset': 'assets/images/1.jpg',
      'title': 'Dumbbells',
    },
    {
      'imageAsset': 'assets/images/1-1-1-scaled.jpg',
      'title': 'Resistance Band',
    },
    {
      'imageAsset': 'assets/images/virbr.jpeg',
      'title': 'Vibration Plate',
    },
    {
      'imageAsset': 'assets/images/1.jpg',
      'title': 'Dumbbells',
    },
    {
      'imageAsset': 'assets/images/1-1-1-scaled.jpg',
      'title': 'Resistance Band',
    },
    {
      'imageAsset': 'assets/images/virbr.jpeg',
      'title': 'Vibration Plate',
    },

    // Add more cards as needed.
  ];

  final List<Map<String, dynamic>> likecardList = [
    {
      'imageAsset': 'assets/images/laptop.png',
      'title': 'Huawei Matebook X 13',
      'price': 20999.00
    },
    {
      'imageAsset': 'assets/images/laptop.png',
      'title': 'Huawei Matebook X 13',
      'price': 20999.00
    },
    {
      'imageAsset': 'assets/images/laptop.png',
      'title': 'Huawei Matebook X 13',
      'price': 20999.00
    },
    {
      'imageAsset': 'assets/images/laptop.png',
      'title': 'Huawei Matebook X 13',
      'price': 20999.00
    },

    // Add more cards as needed.
  ];

  final List<String> imgList = [
    'assets/images/banner4.jpg',
    'assets/images/banner3.jpg',
  ];

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
                subtitle: Text(
                  "Manoj Saini",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      constraints: BoxConstraints(
                        maxWidth: 35,
                        minWidth: 35,
                        maxHeight: 35,
                        minHeight: 35,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          NotificationScreen.routeName,
                        );
                      },
                      icon: Icon(
                        CupertinoIcons.search,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                    badges.Badge(
                      position: badges.BadgePosition.topEnd(top: 0, end: 0),
                      badgeContent: Text(
                        '2',
                        style: TextStyle(color: Colors.white, fontSize: 9),
                      ),
                      child: IconButton(
                          icon: Icon(
                            Icons.shopping_cart_outlined,
                            size: 22,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              CartScreen.routeName,
                            );
                          }),
                    ),
                    IconButton(
                      constraints: BoxConstraints(
                        maxWidth: 35,
                        minWidth: 35,
                        maxHeight: 35,
                        minHeight: 35,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          NotificationScreen.routeName,
                        );
                      },
                      icon: Image.asset(
                        "assets/images/notification.png",
                        width: 30,
                        height: 30,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              CarouselSlider(
                items: imgList
                    .map(
                      (item) => ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset(
                            item,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 120,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  height: size.height / 6,
                  viewportFraction: 1,
                  autoPlay: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        CategoryScreen.routeName,
                        arguments: 1,
                      );
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 6,
                  children: List.generate(
                    cardList.length,
                    (index) => HomeCategory(
                      imageAsset: cardList[index]['imageAsset'],
                      title: cardList[index]['title'],
                      onTap: () {},
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Special Deals For You',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AllCategoryProductScreen.routeName,
                        arguments: "Foot Spa",
                      );
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              ResponsiveGridList(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                minItemWidth: size.width / 2.5,
                children: List.generate(
                  4,
                  (index) => FeaturedCard(
                    title: likecardList[index]['title'],
                    imagePath: likecardList[index]['imageAsset'],
                    price: likecardList[index]['price'],
                    color: Colors
                        .primaries[_random.nextInt(Colors.primaries.length)],
                    onTap: () {},
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Foot Spa',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AllCategoryProductScreen.routeName,
                        arguments: "Foot Spa",
                      );
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 16,
                  children: List.generate(
                    likecardList.length,
                    (index) => ProductCard(
                      title: likecardList[index]['title'],
                      imagePath: likecardList[index]['imageAsset'],
                      price: likecardList[index]['price'],
                      color: Colors
                          .primaries[_random.nextInt(Colors.primaries.length)],
                      onTap: () {},
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Resistance Band',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AllCategoryProductScreen.routeName,
                        arguments: "Resistance Band",
                      );
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 16,
                  children: List.generate(
                    likecardList.length,
                    (index) => ProductCard(
                      title: likecardList[index]['title'],
                      imagePath: likecardList[index]['imageAsset'],
                      price: likecardList[index]['price'],
                      color: Colors
                          .primaries[_random.nextInt(Colors.primaries.length)],
                      onTap: () {},
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Online Sessions',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AllSessionScreen.routeName,
                        arguments: {
                          'title': 'Online Sessions',
                          'type': 'Online',
                        },
                      );
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Session(
                  showDivider: true,
                  color: Colors.primaries[
                      math.Random().nextInt(Colors.primaries.length)]),
              Session(
                  showDivider: false,
                  color: Colors.primaries[
                      math.Random().nextInt(Colors.primaries.length)]),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Enrolled Sessions',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AllSessionScreen.routeName,
                        arguments: {
                          'title': 'Enrolled Sessions',
                          'type': 'Enrolled',
                        },
                      );
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Session(
                showDivider: true,
                color: Colors
                    .primaries[math.Random().nextInt(Colors.primaries.length)],
              ),
              Session(
                showDivider: false,
                color: Colors
                    .primaries[math.Random().nextInt(Colors.primaries.length)],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
