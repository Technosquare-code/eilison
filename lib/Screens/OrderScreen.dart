import 'package:elison/Components/Order.dart';
import 'package:elison/Components/shimmer/OrderShimmer.dart';
import 'package:elison/Components/shimmer/addressShimmer.dart';
import 'package:elison/controllers/customer/profile/orders/orders_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = "OrderScreen";
  final orderController = Get.put(OrderListController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          "Orders",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My Orders",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15),
                    orderController.isLoading.value
                        ? OrderShimmer()
                        : orderController.orderList.isEmpty
                            ? Center(
                                child: Text('No data found'),
                              )
                            : ListView.builder(
                                itemCount: orderController.orderList.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (ctx, i) => Order(
                                  status: orderController.orderList[i].status,
                                  address: orderController.orderList[i].address,
                                  alternateNumber: orderController
                                      .orderList[i].alternateNumber,
                                  city: orderController.orderList[i].city,
                                  country: orderController.orderList[i].country,
                                  createdDate:
                                      orderController.orderList[i].createdDate,
                                  email: orderController.orderList[i].email,
                                  fullName:
                                      orderController.orderList[i].fullName,
                                  id: orderController.orderList[i].id,
                                  itemName:
                                      orderController.orderList[i].itemName,
                                  landmark:
                                      orderController.orderList[i].landmark,
                                  orderNo: orderController.orderList[i].orderNo,
                                  payableAmount: orderController
                                      .orderList[i].payableAmount,
                                  phone: orderController.orderList[i].phone,
                                  state: orderController.orderList[i].state,
                                  thumbnail:
                                      orderController.orderList[i].thumbnail,
                                  town: orderController.orderList[i].town,
                                  transactionNo: orderController
                                      .orderList[i].transactionNo,
                                  zipCode: orderController.orderList[i].zipCode,
                                ),
                              ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
