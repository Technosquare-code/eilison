import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Components/pdf_viewer.dart';
import 'package:elison/Components/product_more_image.dart';
import 'package:elison/Screens/PromocodeScreen.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/controllers/customer/products/product_detail_controller.dart';
import 'package:elison/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Components/viewImage.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = "ProductDetailScreen";

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final prodDetailController =
      Get.put(ProductDetailController(pro_id: Get.arguments[0]));

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return prodDetailController.isLoading.value
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40.0),
                        // Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Stack(
                  children: [
                    SingleChildScrollView(
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Image.network(
                                    mainUrl +
                                        specialItemUrl +
                                        prodDetailController
                                            .productdetails[0].thumbnail,
                                    // "assets/images/product1.jpeg",
                                    width: size.width,
                                    height: size.height / 3.0,
                                    fit: BoxFit.fill,
                                  ),
                                  Positioned(
                                    top: 15,
                                    left: 15,
                                    child: IconButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
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
                                    transform:
                                        Matrix4.translationValues(0, -20, 0),
                                    padding: const EdgeInsets.fromLTRB(
                                        25, 25, 25, 0),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ListTile(
                                            contentPadding: EdgeInsets.zero,
                                            title: Text(
                                              prodDetailController
                                                  .productdetails[0].itemName,
                                              // "Resistance Band",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            subtitle: Text(
                                              // "Product Category",
                                              prodDetailController
                                                  .productdetails[0].category,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            trailing: InkWell(
                                              onTap: () {
                                                prodDetailController
                                                    .wishlistmanaget(
                                                        context: context,
                                                        isAdd:
                                                            !prodDetailController
                                                                .productdetails[
                                                                    0]
                                                                .isWhishlist,
                                                        prod: prodDetailController
                                                            .productdetails[0]);
                                                prodDetailController
                                                        .isWish.value =
                                                    !prodDetailController
                                                        .isWish.value;
                                                setState(() {});
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      offset: Offset(0, 1),
                                                      color:
                                                          Colors.grey.shade100,
                                                      spreadRadius: 1,
                                                      blurRadius: 1,
                                                    ),
                                                    BoxShadow(
                                                      offset: Offset(1, 0),
                                                      color:
                                                          Colors.grey.shade100,
                                                      spreadRadius: 1,
                                                      blurRadius: 1,
                                                    ),
                                                  ],
                                                ),
                                                child: prodDetailController
                                                        .isWish.value
                                                    // prodDetailController
                                                    //         .productdetails[0]
                                                    //         .isWhishlist
                                                    ? Icon(
                                                        Icons.favorite,
                                                        color: primaryColor,
                                                        size: 20,
                                                      )
                                                    : Icon(
                                                        Icons.favorite_outline,
                                                        color: primaryColor,
                                                        size: 20,
                                                      ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Text(
                                                "\$ ${NumberFormat('#,##0').format(double.parse(prodDetailController.productdetails[0].sellingPrice))}",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: primaryColor,
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const SizedBox(width: 15),
                                              Text(
                                                "\$ ${NumberFormat('#,##0').format(double.parse(prodDetailController.productdetails[0].mrp))}",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w700,
                                                  decoration: TextDecoration
                                                      .lineThrough,
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
                                          // Container(
                                          //   height: 100,
                                          //   child: WebView(
                                          //     initialUrl: prodDetailController
                                          //         .productdetails[0].description,
                                          //     // 'data:text/html,<html><body><h1>Hello, world!</h1></body></html>',
                                          //   ),
                                          // ),
                                          Html(
                                            data: prodDetailController
                                                .productdetails[0].description,
                                            onLinkTap: (url, context,
                                                attributes, element) async {
                                              if (!await launchUrl(
                                                  Uri.parse(url!))) {
                                                throw 'Could not launch url';
                                              }
                                            },
                                            shrinkWrap: true,
                                          ),
                                          // ReadMoreText(
                                          //   prodDetailController
                                          //       .productdetails[0].description,
                                          //   // 'Pancakes are some people\'s favorite breakfast, who doesn\'t like pancakes? Especially with the real honey splash on top of the pancakes, of course everyone loves that! besides being. Pancakes are some people\'s favorite breakfast, who doesn\'t like pancakes? Especially with the real honey splash on top of the pancakes, of course everyone loves that! besides being.',
                                          //   trimLines: 4,
                                          //   delimiter: '  ',
                                          //   textAlign: TextAlign.justify,
                                          //   trimMode: TrimMode.Line,
                                          //   trimCollapsedText: 'Read More...',
                                          //   trimExpandedText: '',
                                          //   colorClickableText: primaryColor,
                                          //   style: TextStyle(
                                          //     fontSize: 12,
                                          //     color: Colors.black,
                                          //     fontFamily: "Poppins",
                                          //     fontWeight: FontWeight.w400,
                                          //   ),
                                          //   moreStyle: TextStyle(
                                          //     fontSize: 12,
                                          //     color: primaryColor,
                                          //     fontFamily: "Poppins",
                                          //     fontWeight: FontWeight.w500,
                                          //   ),
                                          // ),
                                          const SizedBox(height: 25),
                                          prodDetailController.productdetails[0]
                                                      .itemManual !=
                                                  ''
                                              ? InkWell(
                                                  onTap: () async {
                                                    String url =
                                                        // 'https://www.example.com';
                                                        mainUrl +
                                                            manualUrl +
                                                            prodDetailController
                                                                .productdetails[
                                                                    0]
                                                                .itemManual;
                                                    if (await canLaunch(url)) {
                                                      await launch(url);
                                                    } else {
                                                      throw 'Could not launch $url';
                                                    }
                                                    //   Navigator.push(
                                                    //       context,
                                                    //       MaterialPageRoute(
                                                    //         builder: (context) => PdfViewer(
                                                    //             url:
                                                    //                 'https://example.com/myPdf.pdf'
                                                    //             //  mainUrl +
                                                    //             //     manualUrl +
                                                    //             //     prodDetailController
                                                    //             //         .productdetails[
                                                    //             //             0]
                                                    //             //         .itemManual,
                                                    //             ),
                                                    //       ));
                                                  },
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          offset: Offset(0, 1),
                                                          color: Colors
                                                              .grey.shade200,
                                                          spreadRadius: 1,
                                                          blurRadius: 4,
                                                        ),
                                                        BoxShadow(
                                                          offset: Offset(1, 0),
                                                          color: Colors
                                                              .grey.shade200,
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
                                                          // prodDetailController
                                                          //     .productdetails[0]
                                                          //     .itemManual,
                                                          "Product manual",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "Poppins",
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                      trailing: Icon(
                                                        CupertinoIcons
                                                            .chevron_down_circle,
                                                        size: 20,
                                                        color: primaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Container(),
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
                                          prodDetailController.productdetails[0]
                                                      .videoUrl !=
                                                  ''
                                              ? ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  child: YoutubePlayer(
                                                    controller:
                                                        prodDetailController
                                                            .controller,
                                                    onReady: () {
                                                      prodDetailController
                                                          .controller
                                                          .addListener(() {
                                                        if (prodDetailController
                                                                .controller
                                                                .value
                                                                .isPlaying &&
                                                            !prodDetailController
                                                                .controller
                                                                .value
                                                                .isFullScreen) {
                                                          SystemChrome
                                                              .setPreferredOrientations([
                                                            DeviceOrientation
                                                                .portraitUp,
                                                          ]);
                                                        }
                                                      });
                                                    },
                                                    liveUIColor: Colors.amber,
                                                  ),
                                                )
                                              : InkWell(
                                                  onTap: () {
                                                    print(
                                                      prodDetailController
                                                          .productdetails[0]
                                                          .videoUrl,
                                                    );
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    child: Image.asset(
                                                      "assets/images/session.PNG",
                                                      width: size.width,
                                                      height: size.height / 5,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),

                                          // VideoPlayerItem(
                                          //   videoUrl: prodDetailController
                                          //       .productdetails[0].videoUrl,
                                          // ),

                                          const SizedBox(height: 55),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Container(
                                  //   child: Transform(
                                  //     transform:
                                  //         Matrix4.translationValues(0, -60, 0),
                                  //     child: SizedBox(
                                  //       width: size.width / 1.2,
                                  //       child: SingleChildScrollView(
                                  //         scrollDirection: Axis.horizontal,
                                  //         child: Wrap(
                                  //           spacing: 10,
                                  //           children: List.generate(
                                  //             prodDetailController
                                  //                 .galleryList.length,
                                  //             (index) => InkWell(
                                  //               onTap: () {
                                  //                 print('object');
                                  //                 Navigator.push(
                                  //                     context,
                                  //                     MaterialPageRoute(
                                  //                       builder: (context) => ImagePage(
                                  //                           imageUrl: mainUrl +
                                  //                               galleryUrl +
                                  //                               prodDetailController
                                  //                                       .galleryList[
                                  //                                   index]),
                                  //                     ));
                                  //               },
                                  //               child: productmoreimage(
                                  //                 imageAsset: mainUrl +
                                  //                     galleryUrl +
                                  //                     prodDetailController
                                  //                         .galleryList[index],
                                  //                 title: prodDetailController
                                  //                     .galleryList[index],
                                  //               ),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),

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
                          Positioned(
                            top: size.height * 0.24,
                            left: 15,
                            child: SizedBox(
                              width: size.width / 1.2,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Wrap(
                                  spacing: 10,
                                  children: List.generate(
                                    prodDetailController.galleryList.length,
                                    (index) => InkWell(
                                      onTap: () {
                                        print('object');
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ImagePage(
                                                  imageUrl: mainUrl +
                                                      galleryUrl +
                                                      prodDetailController
                                                          .galleryList[index]),
                                            ));
                                      },
                                      child: productmoreimage(
                                        imageAsset: mainUrl +
                                            galleryUrl +
                                            prodDetailController
                                                .galleryList[index],
                                        title: prodDetailController
                                            .galleryList[index],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MyButton(
                              sizeWidth: size.width * 0.45,
                              fontSize: 16,
                              sizeHieght: 55,
                              title: prodDetailController.isAdded.value
                                  ? 'Go To Cart'
                                  : "Add to cart",
                              textColor: Colors.white,
                              onTap: () {
                                prodDetailController.isAdded.value
                                    ? Get.toNamed('/cart',
                                        arguments: [true, 0, context])
                                    : prodDetailController.addTocart(context);
                                // Get.toNamed('/promocode-screen');
                                // Navigator.of(context).pushNamed(
                                //   PromocodeScreen.routeName,
                                // );
                              },
                            ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            MyButton(
                              sizeWidth: size.width * 0.45,
                              fontSize: 16,
                              sizeHieght: 55,
                              color: Colors.black,
                              title: "Buy Now",
                              textColor: Colors.white,
                              onTap: () async {
                                bool check = true;
                                await prodDetailController.addTocart(context);
                                if (check) {
                                  Get.toNamed('/cart',
                                      arguments: [true, 1, context]);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
        }),
      ),
    );
  }
}
