import 'package:elison/Components/AddressPart.dart';
import 'package:elison/Components/CartPart.dart';
import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Components/PaymentPart.dart';
import 'package:elison/Components/snackbar.dart';
import 'package:elison/Screens/CongratulationScreen.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/controllers/customer/cart_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../controllers/customer/profile/address/view_address_controller.dart';
import 'NoDataFoundScreen.dart';

class CartScreen extends StatefulWidget {
  static const routeName = "CartScreen";
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartController = Get.put(CartController(isadd: Get.arguments[0]));
  final viewController = Get.put(ViewAddressController());

  int currentPage = 0;
  List pages = [
    CartPart(),
    AddressPart(),
    // PaymentPart(),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() {
      return Scaffold(
        appBar: cartController.cartList.isNotEmpty
            ? AppBar(
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
                  "Cart",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            : AppBar(
                elevation: 0,
                centerTitle: true,
                automaticallyImplyLeading: false,
              ),
        body: cartController.cartList.isEmpty
            ? NoDataFound(
                buttnText: 'Continue Shopping',
                img: 'https://cdn-icons-png.flaticon.com/512/2038/2038854.png',
                title: 'Your Cart Is Empty',
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.shopping_cart,
                              size: 25,
                              color: primaryColor,
                            ),
                            Text(
                              "Cart",
                              style: TextStyle(
                                fontSize: 12,
                                color: primaryColor,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Divider(color: Colors.grey, thickness: 2),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          children: [
                            Icon(
                              Icons.place,
                              size: 25,
                              color: currentPage >= 1
                                  ? primaryColor
                                  : Colors.black,
                            ),
                            Text(
                              "Address",
                              style: TextStyle(
                                fontSize: 12,
                                color: currentPage >= 1
                                    ? primaryColor
                                    : Colors.black,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        // const SizedBox(width: 15),
                        // Expanded(
                        //   child: Divider(color: Colors.grey, thickness: 2),
                        // ),
                        // const SizedBox(width: 15),
                        // Column(
                        //   children: [
                        //     Icon(
                        //       Icons.credit_card,
                        //       size: 25,
                        //       color: currentPage == 2 ? primaryColor : Colors.black,
                        //     ),
                        //     Text(
                        //       "Payment",
                        //       style: TextStyle(
                        //         fontSize: 11,
                        //         color: currentPage == 2 ? primaryColor : Colors.black,
                        //         fontFamily: "Poppins",
                        //         fontWeight: FontWeight.w500,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Divider(color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  Expanded(child: pages[currentPage]),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() {
                          return Text(
                            "\$${cartController.totalSelling()}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        }),
                        MyButton(
                          title: "CHECKOUT",
                          borderRadius: 5,
                          sizeWidth: size.width / 2.5,
                          sizeHieght: 40,
                          fontSize: 16,
                          onTap: () {
                            if (currentPage == 0) {
                              currentPage++;
                            } else {
                              if (cartController.addressId.value != '') {
                                print(
                                    '000000000000000000000 ---------${cartController.addressId.value}');

                                dynamic ssss = cartController.totalSelling();
                                cartController.addMoney(context,
                                    totalMoney: ssss.toString());
                                // currentPage++;
                              } else {
                                // Fluttertoast.showToast(msg: 'Select Address');
                                snackbar(
                                    context: context,
                                    msg: 'Select Address to Checkout',
                                    title: 'Failed');
                              }
                            }
                            setState(() {});

                            // if (currentPage < pages.length - 1) {
                            //   if (currentPage == 0) {
                            //     print(currentPage.toString() + ' ................');
                            //     currentPage++;
                            //   }
                            //   if (currentPage == 1) {
                            //     print('object-------------------');
                            //     if (cartController.addressId.value != '') {
                            //       print('000000000000000000000');
                            //       // snackbar(
                            //       //     context: context,
                            //       //     msg: 'Select Address',
                            //       //     title: 'Failed');
                            //       currentPage++;

                            //       cartController.addMoney(context,
                            //           totalMoney: cartController.totalSelling());
                            //     } else {
                            //       Fluttertoast.showToast(msg: 'Select Address');
                            //     }
                            //   }
                            //   setState(() {});
                            //   print('page-------------$currentPage');
                            // }
                            // else {
                            //   Navigator.of(context).pushNamed(
                            //     CongratulationScreen.routeName,
                            //   );
                            // }
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
      );
    });
  }
}
