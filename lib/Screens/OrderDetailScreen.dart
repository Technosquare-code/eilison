import 'package:elison/Components/Help.dart';
import 'package:elison/Components/MyButton2.dart';
import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Utils/Utils.dart';
import 'package:elison/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderDetailScreen extends StatelessWidget {
  static const routeName = "OrderDetailScreen";

  String? id;
  String? orderNo;
  String? payableAmount;
  String? transactionNo;
  DateTime? createdDate;
  String? itemName;
  String? thumbnail;
  String? fullName;
  String? email;
  String? phone;
  String? alternateNumber;
  String? address;
  String? zipCode;
  String? city;
  String? country;
  String? landmark;
  String? state;
  String? town;
  OrderDetailScreen(
      {this.address,
      this.alternateNumber,
      this.city,
      this.country,
      this.createdDate,
      this.email,
      this.fullName,
      this.id,
      this.itemName,
      this.landmark,
      this.orderNo,
      this.payableAmount,
      this.phone,
      this.state,
      this.thumbnail,
      this.town,
      this.transactionNo,
      this.zipCode});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black,
            size: 20,
          ),
        ),
        title: Text(
          "Order Detail",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderNo ?? "ORDER 243242",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Divider(color: Colors.grey),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Image.network(
                        // "assets/images/laptop.png",
                        mainUrl + specialItemUrl + thumbnail!,
                        width: size.width / 4,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: SizedBox(
                          height: 95,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                itemName ?? "Huawei Matebook X 13",
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                              Text(
                                "Qty: 1",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    // "\$$amo",
                                    NumberFormat('#,##0').format(payableAmount),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  // Text(
                                  //   "Intransit",
                                  //   style: TextStyle(
                                  //     fontSize: 14,
                                  //     color: Colors.black,
                                  //     fontFamily: "Poppins",
                                  //     fontWeight: FontWeight.w400,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(height: 15),
                  // Divider(color: Colors.grey),
                  // const SizedBox(height: 15),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.end,
                  //   children: [
                  //     MyButton2(
                  //       title: "Intransit",
                  //       fontSize: 12,
                  //       color: Colors.grey,
                  //       borderRadius: 5,
                  //       icon: Icons.local_shipping,
                  //       iconSize: 15,
                  //       sizeWidth: size.width / 2.5,
                  //       sizeHieght: 48,
                  //       onTap: () {},
                  //     ),
                  //     const SizedBox(width: 25),
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           FittedBox(
                  //             fit: BoxFit.scaleDown,
                  //             child: Text(
                  //               "13-Mar 2023 08:03 pm",
                  //               style: TextStyle(
                  //                 fontSize: 12,
                  //                 color: Colors.black,
                  //                 fontFamily: "Poppins",
                  //                 fontWeight: FontWeight.w400,
                  //               ),
                  //             ),
                  //           ),
                  //           FittedBox(
                  //             fit: BoxFit.scaleDown,
                  //             child: Text(
                  //               "Tracking ID: $transactionNo",
                  //               style: TextStyle(
                  //                 fontSize: 12,
                  //                 color: Colors.black,
                  //                 fontFamily: "Poppins",
                  //                 fontWeight: FontWeight.w400,
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 15),
                  Divider(color: Colors.grey),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Order Price",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "\$${NumberFormat('#,##0').format(payableAmount)}",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Divider(color: Colors.grey),
                  const SizedBox(height: 15),
                  Text(
                    "Shipping Detail",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    // "Manoj Saini",
                    fullName!,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "$address, $landmark, $town, $city, $country, $zipCode, $state, $phone $alternateNumber.",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Divider(color: Colors.grey),
                  // const SizedBox(height: 15),
                  // Text(
                  //   "Payment Method",
                  //   style: TextStyle(
                  //     fontSize: 14,
                  //     color: Colors.black,
                  //     fontFamily: "Poppins",
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                  // const SizedBox(height: 10),
                  // Row(
                  //   children: [
                  //     Image.asset(
                  //       "assets/images/wallet.png",
                  //       width: 30,
                  //       height: 25,
                  //       fit: BoxFit.fill,
                  //     ),
                  //     const SizedBox(width: 15),
                  //     Expanded(
                  //       child: Text(
                  //         "Eilison Wallets",
                  //         style: TextStyle(
                  //           fontSize: 14,
                  //           color: Colors.black,
                  //           fontFamily: "Poppins",
                  //           fontWeight: FontWeight.w400,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 15),
                  Divider(color: Colors.grey),
                  const SizedBox(height: 15),
                  Text(
                    "Contact Number",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Phone: $phone",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Email: $email",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: MyButton(
        title: "NEED HELP?",
        fontSize: 14,
        borderRadius: 0,
        sizeHieght: 40,
        onTap: () {
          Utils.showMyBottomSheet(context, Help());
        },
      ),
    );
  }
}
