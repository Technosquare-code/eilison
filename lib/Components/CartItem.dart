import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/customer/cart_controller.dart';

class CartItem extends StatefulWidget {
  String? img;
  String? cutprice;
  String? sellingPrice;
  String? title;
  String? id;
  CartItem({this.cutprice, this.title, this.id, this.img, this.sellingPrice});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CachedNetworkImage(
                imageUrl: widget.img!,
                width: size.width / 5,
                height: 80,
                fit: BoxFit.fill,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              // Image.network(
              //   // "assets/images/laptop.png",
              //   widget.img!,
              //   width: size.width / 5,
              //   height: 80,
              //   fit: BoxFit.fill,
              // ),
              SizedBox(width: 15),
              Expanded(
                child: SizedBox(
                  height: 70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // "Huawei Matebook X 13",
                        widget.title!, maxLines: 2,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "\$${NumberFormat('#,##0').format(double.parse(widget.sellingPrice ?? '0'))}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            "\$${NumberFormat('#,##0').format(double.parse(widget.cutprice ?? '0'))}",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.black,
                              decorationThickness: 1.5,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                padding: const EdgeInsets.all(5),
                child: Text(
                  "QTY : 1",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Divider(color: Colors.grey),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: cartController.isLoading.value
                    ? null
                    : () {
                        cartController.removeProduct(widget.id!, context);
                      },
                child: SizedBox(
                  width: size.width / 2.5,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      !cartController.isLoading.value ? "Remove" : 'Loading...',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 20,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  border: Border(left: BorderSide(color: Colors.grey)),
                ),
              ),
              InkWell(
                onTap: cartController.isLoading.value
                    ? null
                    : () {
                        cartController.moveToWishlist(widget.id!, context);
                      },
                child: SizedBox(
                  width: size.width / 2.5,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Move to Wishlist",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Divider(color: Colors.grey),
        ],
      ),
    );
  }
}
