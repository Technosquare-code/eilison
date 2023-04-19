import 'package:elison/Components/CartItem.dart';
import 'package:elison/Components/InputFeild.dart';
import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Screens/PromocodeScreen.dart';
import 'package:elison/controllers/customer/cart_controller.dart';
import 'package:elison/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPart extends StatelessWidget {
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() {
      return cartController.isLoading.value
          ? CircularProgressIndicator()
          : cartController.cartList.isEmpty
              ? Center(child: Text('Your Cart Is Empty'))
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartController.cartList.length,
                        shrinkWrap: true,
                        itemBuilder: (ctx, i) => CartItem(
                          cutprice: cartController.cartList[i].mrp,
                          id: cartController.cartList[i].cartRecordId,
                          img: mainUrl +
                              specialItemUrl +
                              cartController.cartList[i].thumbnail,
                          sellingPrice: cartController.cartList[i].sellingPrice,
                          title: cartController.cartList[i].itemName,
                        ),
                      ),
                    ),
                    Divider(color: Colors.grey.shade100, thickness: 5),
                    // Container(
                    //   margin: const EdgeInsets.symmetric(horizontal: 20),
                    //   decoration: BoxDecoration(
                    //     color: Colors.grey.shade100,
                    //     borderRadius: BorderRadius.circular(5),
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         child: InputField(
                    //           readOnly: true,
                    //           color: Colors.grey.shade100,
                    //           hint: "Promo Code",
                    //           borderRadius: 5,
                    //           size: 20,
                    //         ),
                    //       ),
                    //       MyButton(
                    //         title: "Apply Promo",
                    //         sizeWidth: size.width / 4,
                    //         borderRadius: 5,
                    //         sizeHieght: 48,
                    //         onTap: () {
                    //           Navigator.of(context).pushNamed(
                    //             PromocodeScreen.routeName,
                    //           );
                    //         },
                    //       )
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Text(
                        "Price Details ( 1 items )",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(color: Colors.grey),
                    ),
                    PaymentDetails(
                        title: "Total MRP (Inc. of Taxes)", value: "\$2999"),
                    PaymentDetails(title: "Eilison Discount", value: "-\$1000"),
                    PaymentDetails(title: "Shipping", value: "Free"),
                  ],
                );
    });
  }
}

class PaymentDetails extends StatelessWidget {
  final String title;
  final String value;

  const PaymentDetails({
    required this.title,
    required this.value,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
