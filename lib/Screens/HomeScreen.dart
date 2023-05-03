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
import 'package:elison/controllers/customer/home_screen_controller.dart';
import 'package:elison/controllers/customer/mainscreen_controller.dart';
import 'package:elison/urls.dart';
import 'package:elison/package%20edit/src/responsive_grid_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

import '../Components/FeaturedCArd.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Random _random = Random();
  final mainscreenController = Get.find<MainScreenController>();
  final homescreenController = Get.put(HomeScreenController());

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
        child: Obx(() {
          homescreenController.i.value = -1;
          return mainscreenController.isLoading.value &&
                  homescreenController.isLoading.value &&
                  homescreenController.dynamicItemList.isEmpty
              ? HomeShimmer(size: size)
              : SingleChildScrollView(
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
                          mainscreenController.userdetailList.isNotEmpty
                              ? mainscreenController.userdetailList[0].data.name
                              : "",
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
                                // Navigator.of(context).pushNamed(
                                //   NotificationScreen.routeName,
                                // );
                              },
                              icon: Icon(
                                CupertinoIcons.search,
                                color: Colors.black,
                                size: 25,
                              ),
                            ),
                            badges.Badge(
                              position:
                                  badges.BadgePosition.topEnd(top: 0, end: 0),
                              badgeContent: Text(
                                mainscreenController.userdetailList.isNotEmpty
                                    ? mainscreenController
                                        .userdetailList[0].data.totalCartItems
                                    : '0',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 9),
                              ),
                              child: IconButton(
                                  icon: Icon(
                                    Icons.shopping_cart_outlined,
                                    size: 22,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    Get.toNamed('/cart', arguments: [false]);
                                    // Navigator.of(context).pushNamed(
                                    //   CartScreen.routeName,
                                    // );
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
                                print('noti-------------');
                                Get.toNamed('/notification');
                                // Navigator.of(context).pushNamed(
                                //   NotificationScreen.routeName,
                                // );
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
                      homescreenController.bannerList.isNotEmpty
                          ? CarouselSlider(
                              items: homescreenController
                                  .bannerList.value[0].data
                                  .map(
                                    (item) => ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Image.network(
                                            mainUrl +
                                                bannerUrl +
                                                item.bannerImage,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: 120,
                                          ),
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
                            )
                          : SizedBox(height: 25),
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
                              Get.toNamed('/category-screen');

                              // Navigator.of(context).pushNamed(
                              //   CategoryScreen.routeName,
                              //   arguments: 1,
                              // );
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
                      homescreenController.categoryList.isNotEmpty
                          ? SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Wrap(
                                spacing: 6,
                                children: List.generate(
                                  homescreenController.categoryList.length,
                                  (index) => HomeCategory(
                                    imageAsset: mainUrl +
                                        categoryUrl +
                                        homescreenController
                                            .categoryList[index].categoryIcon,
                                    title: homescreenController
                                        .categoryList[index].categoryName,
                                    onTap: () {
                                      print('object');
                                      Get.toNamed('/show-products-screen',
                                          arguments: [
                                            'category',
                                            homescreenController
                                                .categoryList[index].id,
                                            homescreenController
                                                .categoryList[index]
                                                .categoryName
                                          ]);
                                    },
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      const SizedBox(height: 15),
                      homescreenController.specialItemList.isEmpty
                          ? Container()
                          : Row(
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
                                    Get.toNamed('/see-All-products-screen',
                                        arguments: [
                                          homescreenController.specialItemList,
                                          'Special Deals For You'
                                        ]);
                                    // Navigator.of(context).pushNamed(
                                    //   AllCategoryProductScreen.routeName,
                                    //   arguments: "Foot Spa",
                                    // );
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
                      homescreenController.specialItemList.isEmpty
                          ? Container()
                          : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Wrap(
                                spacing: 16,
                                children: List.generate(
                                  homescreenController.specialItemList.length >=
                                          2
                                      ? 2
                                      : homescreenController
                                          .specialItemList.length,
                                  (index) => FeaturedCard(
                                    isFavourite: homescreenController
                                        .specialItemList[index].isWhishlist,
                                    id: homescreenController
                                        .specialItemList[index].id,
                                    title: homescreenController
                                        .specialItemList[index].itemName,
                                    imagePath: mainUrl +
                                        specialItemUrl +
                                        homescreenController
                                            .specialItemList[index].thumbnail,
                                    price: double.parse(homescreenController
                                        .specialItemList[index].mrp),
                                    color: Colors.colr[
                                        _random.nextInt(Colors.colr.length)],
                                    onTap: () {
                                      homescreenController.wishlistmanaget(
                                          isAdd: !(homescreenController
                                              .specialItemList[index]
                                              .isWhishlist),
                                          context: context,
                                          prod: homescreenController
                                              .specialItemList[index]);
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ),
                            ),
                      Column(
                        children: homescreenController.dynamicItemList.map(
                          (element) {
                            return Column(
                              children: [
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${element.category!.categoryName}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        int ii = homescreenController.i.value;

                                        Get.toNamed('/see-All-products-screen',
                                            arguments: [
                                              element.productList,
                                              element.category!.categoryName
                                            ]);
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
                                element.productList!.length != 0 &&
                                        homescreenController.lalal.value
                                    ? SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: element.productList!.isNotEmpty
                                            ? Wrap(
                                                spacing: 16,
                                                children: List.generate(
                                                  element.productList!.length,
                                                  (index) => ProductCard(
                                                    title: element
                                                        .productList![index]
                                                        .itemName,
                                                    productId: element
                                                        .productList![index].id,
                                                    imagePath: mainUrl +
                                                        specialItemUrl +
                                                        element
                                                            .productList![index]
                                                            .thumbnail,
                                                    price: double.parse(element
                                                        .productList![index]
                                                        .mrp),
                                                    color: Colors.colr[
                                                        _random.nextInt(Colors
                                                            .colr.length)],
                                                    onTap: () {
                                                      homescreenController
                                                          .wishlistmanagerfordynamic(
                                                              isAdd: !(element
                                                                  .productList![
                                                                      index]
                                                                  .isWhishlist),
                                                              context: context,
                                                              prod: element
                                                                      .productList![
                                                                  index]);
                                                      setState(() {});
                                                    },
                                                    isFavourite: element
                                                        .productList![index]
                                                        .isWhishlist,
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                      )
                                    : Container(),
                                const SizedBox(height: 15),
                              ],
                            );
                          },
                        ).toList(),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       'Resistance Band',
                      //       style: TextStyle(
                      //         fontSize: 16,
                      //         color: Colors.black,
                      //         fontFamily: "Poppins",
                      //         fontWeight: FontWeight.w600,
                      //       ),
                      //     ),
                      //     InkWell(
                      //       onTap: () {
                      //         Navigator.of(context).pushNamed(
                      //           AllCategoryProductScreen.routeName,
                      //           arguments: "Resistance Band",
                      //         );
                      //       },
                      //       child: Text(
                      //         'See All',
                      //         style: TextStyle(
                      //           fontSize: 12,
                      //           color: Colors.black,
                      //           fontFamily: "Poppins",
                      //           fontWeight: FontWeight.w400,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(height: 15),
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: Wrap(
                      //     spacing: 16,
                      //     children: List.generate(
                      //       likecardList.length,
                      //       (index) => ProductCard(
                      //         isFavourite: true,
                      //         productId: '',
                      //         title: likecardList[index]['title'],
                      //         imagePath: likecardList[index]['imageAsset'],
                      //         price: likecardList[index]['price'],
                      //         color: Colors
                      //             .colr[_random.nextInt(Colors.colr.length)],
                      //         onTap: () {},
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(height: 15),
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
                        color: Colors.primaries[
                            math.Random().nextInt(Colors.primaries.length)],
                      ),
                      Session(
                        showDivider: false,
                        color: Colors.primaries[
                            math.Random().nextInt(Colors.primaries.length)],
                      ),
                    ],
                  ),
                );
        }),
      ),
    );
  }
}

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(
        colors: [
          Colors.grey[200]!,
          Colors.grey[300]!,
          Colors.grey[200]!,
        ],
        begin: Alignment(-1.0, -0.5),
        end: Alignment(1.0, 0.5),
        stops: [0.0, 0.5, 1.0],
        tileMode: TileMode.clamp,
      ),
      // period: Duration(seconds: 2),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.1,
              color: Colors.grey[300],
            ),
            SizedBox(height: 20),
            Container(
              height: size.height * 0.3,
              color: Colors.grey[300],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: size.height * 0.15,
                    color: Colors.grey[300],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: size.height * 0.15,
                    color: Colors.grey[300],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: size.height * 0.15,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: size.height * 0.2,
                    color: Colors.grey[300],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: size.height * 0.2,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
