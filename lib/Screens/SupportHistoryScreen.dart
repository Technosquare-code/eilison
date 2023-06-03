import 'package:elison/Components/ChatHistory.dart';
import 'package:elison/Components/shimmer/SupportHistoryShimmer.dart';
import 'package:elison/controllers/customer/profile/support/support_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class SupportHistoryScreen extends StatelessWidget {
  static const routeName = "SupportHistoryScreen";
  final suportController = Get.put(SupportController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
          "Support History",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width,
              color: Colors.grey.shade200,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              child: Text(
                "Pervious Support History",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Obx(() {
              return suportController.isLoading.value
                  ? SupportHistoryShimmer()
                  : suportController.supportList.isEmpty
                      ? Container(
                          height: size.height * 0.6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(child: Text('No data found')),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: suportController.supportList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (ctx, i) => ChatHistory(
                            closeDate:
                                suportController.supportList[i].closeDate,
                            id: suportController.supportList[i].id,
                            createdDate:
                                suportController.supportList[i].createdDate,
                            email: suportController.supportList[i].email,
                            message: suportController.supportList[i].message,
                            name: suportController.supportList[i].name,
                            orderNo: suportController.supportList[i].orderNo,
                            phone: suportController.supportList[i].phone,
                            status: suportController.supportList[i].status,
                            token: suportController.supportList[i].token,
                          ),
                        );
            }),
          ],
        ),
      ),
    );
  }
}
