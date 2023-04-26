import 'package:elison/Components/MyAddress.dart';
import 'package:elison/Screens/AddNewAddressScreen.dart';
import 'package:elison/controllers/customer/profile/address/view_address_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../Components/shimmer/addressShimmer.dart';

class AddressScreen extends StatelessWidget {
  static const routeName = "AddressScreen";
  final viewController = Get.put(ViewAddressController());
  @override
  Widget build(BuildContext context) {
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
          "My Address",
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
                  InkWell(
                    onTap: () {
                      Get.toNamed('/add-address', arguments: [true, null]);
                      // Navigator.of(context).pushNamed(
                      //   AddNewAddressScreen.routeName,
                      // );
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 25,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Add New Address",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(() {
                    return viewController.isLoading.value
                        ? AddressShimmer(
                            size: MediaQuery.of(context).size,
                          )
                        : viewController.addressList.isEmpty
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(child: Text('No data found')),
                                ],
                              )
                            : ListView.builder(
                                itemCount: viewController.addressList.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (ctx, i) => MyAddress(
                                  address:
                                      viewController.addressList[i].address,
                                  city: viewController.addressList[i].city,
                                  name: viewController.addressList[i].fullName,
                                  phone: viewController.addressList[i].phone,
                                  state: viewController.addressList[i].town,
                                  zipcode:
                                      viewController.addressList[i].zipCode,
                                  id: i,
                                ),
                              );
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
