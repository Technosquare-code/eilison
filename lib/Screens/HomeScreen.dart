import 'dart:math' as math;
import 'dart:math';
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:elison/Components/HomeCategory.dart';
import 'package:elison/Components/ProductCard.dart';
import 'package:elison/Components/Sessions.dart';
import 'package:elison/Components/shimmer/HomeShimmer.dart';
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
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../Components/FeaturedCArd.dart';
import '../controllers/trainer/session_detail_controller.dart';

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
  final detailController = Get.put(SessionDetailController());
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            mainscreenController.isLoading(true);
            await mainscreenController.getuserdetails(context);
            mainscreenController.isLoading(false);
            // TODO: implement onReady
            homescreenController.isLoading(true);
            await homescreenController.getbanner();
            await homescreenController.getcategory();
            await homescreenController.getdynamiccategory();
            // await getNotification();
            await homescreenController.getSpecialItem();
            await homescreenController.getOnlineSessions('home');
            await homescreenController.getEnrollSessions('home');

            homescreenController.isLoading(false);
          },
          child: Obx(() {
            return mainscreenController.isLoading.value ||
                    homescreenController.isLoading.value
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
                                ? mainscreenController
                                    .userdetailList[0].data.name
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
                              // IconButton(
                              //   constraints: BoxConstraints(
                              //     maxWidth: 35,
                              //     minWidth: 35,
                              //     maxHeight: 35,
                              //     minHeight: 35,
                              //   ),
                              //   onPressed: () {
                              //     // Navigator.of(context).pushNamed(
                              //     //   NotificationScreen.routeName,
                              //     // );
                              //   },
                              //   icon: Icon(
                              //     CupertinoIcons.search,
                              //     color: Colors.black,
                              //     size: 25,
                              //   ),
                              // ),
                              badges.Badge(
                                position:
                                    badges.BadgePosition.topEnd(top: 0, end: 0),
                                badgeContent: Text(
                                  mainscreenController.userdetailList.isNotEmpty
                                      ? mainscreenController
                                          .userdetailList[0].data.totalCartItems
                                      : '0',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 9),
                                ),
                                child: IconButton(
                                    icon: Icon(
                                      Icons.shopping_cart_outlined,
                                      size: 22,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      Get.toNamed('/cart',
                                          arguments: [false, 0, context]);
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
                                            child: CachedNetworkImage(
                                              imageUrl: mainUrl +
                                                  bannerUrl +
                                                  item.bannerImage,
                                              placeholder: (context, url) =>
                                                  CircularProgressIndicator(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                              height: 120,
                                            ),
                                            // Image.network(
                                            //   mainUrl +
                                            //       bannerUrl +
                                            //       item.bannerImage,
                                            //   fit: BoxFit.cover,
                                            //   width: double.infinity,
                                            //   height: 120,
                                            // ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            homescreenController
                                                .specialItemList,
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
                                    homescreenController
                                                .specialItemList.length >=
                                            6
                                        ? 6
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
                                      color:
                                          colorList[index % colorList.length],
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

                                          Get.toNamed(
                                              '/see-All-products-screen',
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
                                                          .productList![index]
                                                          .id,
                                                      imagePath: mainUrl +
                                                          specialItemUrl +
                                                          element
                                                              .productList![
                                                                  index]
                                                              .thumbnail,
                                                      price: double.parse(
                                                          element
                                                              .productList![
                                                                  index]
                                                              .mrp),
                                                      color: colorList[index %
                                                          colorList.length],
                                                      onTap: () {
                                                        homescreenController
                                                            .wishlistmanagerfordynamic(
                                                                isAdd: !(element
                                                                    .productList![
                                                                        index]
                                                                    .isWhishlist),
                                                                context:
                                                                    context,
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
                                homescreenController.getSeeAllOnlineSessions();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AllSessionScreen(
                                          isenrolled: false,
                                          title: 'Online Sessions',
                                          sessions: homescreenController
                                              .seeAllOnlinSessionList),
                                    ));
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
                        Wrap(
                          spacing: 3,
                          children: List.generate(
                            homescreenController.onlinSessionList.length,
                            (index) => Session(
                                coachId: homescreenController
                                    .onlinSessionList[index].coachId,
                                coach_name: homescreenController
                                    .onlinSessionList[index].coach_name,
                                coach_profile_picture: homescreenController
                                    .onlinSessionList[index]
                                    .coach_profile_picture,
                                isEnrolled: false,
                                is_joined: false,
                                date: DateFormat('d MMM y').format(
                                    homescreenController
                                        .onlinSessionList[index].sessionDate),
                                duration: homescreenController
                                    .onlinSessionList[index].duration,
                                img: homescreenController
                                    .onlinSessionList[index].image,
                                time: homescreenController
                                    .onlinSessionList[index].sessionTime,
                                title: homescreenController
                                    .onlinSessionList[index].sessionName,
                                category: homescreenController
                                    .onlinSessionList[index]
                                    .sessionCategoryName,
                                showDivider: index !=
                                    homescreenController.onlinSessionList.length -
                                        1,
                                agenda: homescreenController
                                    .onlinSessionList[index].agenda,
                                description: homescreenController
                                    .onlinSessionList[index].description,
                                sessionId: homescreenController
                                    .onlinSessionList[index].id,
                                sessiontype: homescreenController
                                    .onlinSessionList[index].sessionType,
                                zoomlink: homescreenController
                                    .onlinSessionList[index].zoomLink,
                                color: Colors.primaries[math.Random().nextInt(Colors.primaries.length)]),
                          ),
                        ),
                        const SizedBox(height: 25),
                        homescreenController.enrolledSessionList.isNotEmpty
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  homescreenController
                                          .enrolledSessionList.isNotEmpty
                                      ? InkWell(
                                          onTap: () {
                                            homescreenController
                                                .getSeeAllEnrolledSessions();
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      AllSessionScreen(
                                                          title:
                                                              'Enrolled Sessions',
                                                          isenrolled: true,
                                                          sessions:
                                                              homescreenController
                                                                  .seeAllEnrolledSessionList),
                                                ));
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
                                        )
                                      : Container(),
                                ],
                              )
                            : Container(),
                        const SizedBox(height: 15),
                        homescreenController.enrolledSessionList.isNotEmpty
                            ? Wrap(
                                spacing: 3,
                                children: List.generate(
                                  homescreenController
                                      .enrolledSessionList.length,
                                  (index) => Session(
                                      coachId: homescreenController
                                          .enrolledSessionList[index].coachId,
                                      coach_name: homescreenController
                                          .enrolledSessionList[index]
                                          .coach_name,
                                      coach_profile_picture: homescreenController
                                          .enrolledSessionList[index]
                                          .coach_profile_picture,
                                      isEnrolled: true,
                                      date: DateFormat('d MMM y').format(
                                          homescreenController
                                              .enrolledSessionList[index]
                                              .sessionDate),
                                      duration: homescreenController
                                          .enrolledSessionList[index].duration,
                                      img: homescreenController
                                          .enrolledSessionList[index].image,
                                      time: homescreenController
                                          .enrolledSessionList[index]
                                          .sessionTime,
                                      title: homescreenController
                                          .enrolledSessionList[index]
                                          .sessionName,
                                      category: homescreenController
                                          .enrolledSessionList[index]
                                          .sessionCategoryName,
                                      showDivider: index !=
                                          homescreenController
                                                  .enrolledSessionList.length -
                                              1,
                                      agenda: homescreenController
                                          .enrolledSessionList[index].agenda,
                                      description: homescreenController
                                          .enrolledSessionList[index]
                                          .description,
                                      sessionId: homescreenController.enrolledSessionList[index].id,
                                      sessiontype: homescreenController.enrolledSessionList[index].sessionType,
                                      zoomlink: homescreenController.enrolledSessionList[index].zoomLink,
                                      color: Colors.primaries[math.Random().nextInt(Colors.primaries.length)],
                                      is_joined: homescreenController.enrolledSessionList[index].is_joined ?? false),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Center(child: Text('No Data Found')),
                              ),
                      ],
                    ),
                  );
          }),
        ),
      ),
    );
  }
}
