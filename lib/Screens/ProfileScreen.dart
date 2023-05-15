import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Screens/AddressScreen.dart';
import 'package:elison/Screens/EditProfileScreen.dart';
import 'package:elison/Screens/LoginScreen.dart';
import 'package:elison/Screens/MySessionScreen.dart';
import 'package:elison/Screens/OrderScreen.dart';
import 'package:elison/Screens/PromocodeScreen.dart';
import 'package:elison/Screens/SupportHistoryScreen.dart';
import 'package:elison/Screens/SupportScreen.dart';
import 'package:elison/Screens/UserReviewsScreen.dart';
import 'package:elison/Screens/WarrantyManagementScreen.dart';
import 'package:elison/Screens/WhishlistScreen.dart';
import 'package:elison/Screens/customer_about.dart';
import 'package:elison/Screens/customer_privacy_policy.dart';
import 'package:elison/Screens/customer_refund_policy.dart';
import 'package:elison/Screens/customer_terms_conditions.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/customer/mainscreen_controller.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool notification = true;
  final mainscreenController = Get.find<MainScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w400,
          ),
        ),
        // actions: [
        //   InkWell(
        //     onTap: () {
        //       Navigator.of(context).pushNamed(
        //         EditProfileScreen.routeName,
        //       );
        //     },
        //     child: Image.asset(
        //       "assets/images/edit.png",
        //       width: 20,
        //       height: 20,
        //     ),
        //   ),
        //   const SizedBox(width: 15),
        // ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 65),
        child: Obx(() {
          return Column(
            children: [
              mainscreenController.userdetailList.isNotEmpty
                  ? mainscreenController
                              .userdetailList[0].data.profilePicture !=
                          null
                      ? CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.orange,
                          backgroundImage: NetworkImage(mainUrl +
                              imageUrl +
                              mainscreenController
                                  .userdetailList[0].data.profilePicture!),
                        )
                      : CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.orange,
                          backgroundImage:
                              AssetImage("assets/images/profile.jpg"),
                        )
                  : CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.orange,
                      backgroundImage: AssetImage("assets/images/profile.jpg"),
                    ),
              const SizedBox(height: 20),
              Text(
                mainscreenController.userdetailList.isNotEmpty
                    ? mainscreenController.userdetailList[0].data.name
                    : "Manoj Saini",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.fromLTRB(25, 15, 25, 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Item(
                      Icons.insert_chart_outlined,
                      "Orders",
                      onTap: () {
                        Get.toNamed('/order-screen');
                        // Navigator.of(context).pushNamed(
                        //   OrderScreen.routeName,
                        // );
                      },
                    ),
                    Item(
                      Icons.map_outlined,
                      "Address",
                      onTap: () {
                        Get.toNamed('/address-page');
                        // Navigator.of(context).pushNamed(
                        //   AddressScreen.routeName,
                        // );
                      },
                    ),
                    Item(
                      Icons.person_outline,
                      "Profile",
                      onTap: () {
                        Get.toNamed('/edit-profile-user');
                        // Navigator.of(context).pushNamed(
                        //   EditProfileScreen.routeName,
                        // );
                      },
                    ),
                    Item(
                      Icons.favorite_outline,
                      "Wishlist",
                      onTap: () {
                        Get.toNamed('/wishlist-screen');
                        // Navigator.of(context).pushNamed(
                        //   WishlistScreen.routeName,
                        // );
                      },
                    ),
                    // Item(
                    //   Icons.local_activity_outlined,
                    //   "Promocode",
                    //   onTap: () {
                    //     Navigator.of(context).pushNamed(
                    //       PromocodeScreen.routeName,
                    //     );
                    //   },
                    // ),
                    Item(
                      Icons.headset_mic_outlined,
                      "Support",
                      onTap: () {
                        // Navigator.of(context).pushNamed(
                        //   SupportScreen.routeName,
                        // );
                        Get.toNamed('/support-screen');
                      },
                    ),
                    Item(
                      Icons.event_note,
                      "Extended Warranty Management",
                      onTap: () {
                        Get.toNamed('/warrenty-screen');
                        // Navigator.of(context).pushNamed(
                        //   WarrantyManagementScreen.routeName,
                        // );
                      },
                    ),
                    Item(
                      Icons.class_outlined,
                      "My Sessions",
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          MySessionScreen.routeName,
                        );
                      },
                    ),
                    Item(
                      Icons.chrome_reader_mode_outlined,
                      "Previous Support History",
                      onTap: () {
                        Get.toNamed('/previous-support-screen');
                        // Navigator.of(context).pushNamed(
                        //   SupportHistoryScreen.routeName,
                        // );
                      },
                    ),
                    Item(
                      Icons.star_outline,
                      "My Reviews",
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          UserReviewScreen.routeName,
                        );
                      },
                    ),
                    Item(
                      Icons.lock_outline,
                      "Change Password",
                      onTap: () {
                        Get.toNamed('/change-pass');
                        // Navigator.of(context).pushNamed(
                        //   UserReviewScreen.routeName,
                        // );
                      },
                    ),
                    Item(
                      Icons.menu_book_rounded,
                      "About Us",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AboutUs(),
                            ));
                      },
                    ),
                    Item(
                      Icons.privacy_tip_rounded,
                      "Privacy Policy",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PrivacyPolicy(),
                            ));
                      },
                    ),
                    Item(
                      Icons.refresh_rounded,
                      "Refund Policy",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RefundPolicy(),
                            ));
                      },
                    ),
                    Item(
                      Icons.live_help,
                      "Terms And Conditions",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TermsConditions(),
                            ));
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(25, 5, 25, 15),
        child: MyButton(
          title: 'LOGOUT',
          borderRadius: 5,
          fontSize: 14,
          onTap: () {
            GetStorage().erase();
            // Navigator.of(context).pushNamed(LoginScreen.routeName);
            Get.offAllNamed('/login-screen');
          },
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function()? onTap;

  const Item(this.icon, this.title, {this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: ListTile(
        dense: true,
        horizontalTitleGap: 2,
        contentPadding: EdgeInsets.zero,
        onTap: onTap,
        leading: Icon(
          icon,
          color: Colors.black,
          size: 20,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
          size: 12,
        ),
      ),
    );
  }
}
