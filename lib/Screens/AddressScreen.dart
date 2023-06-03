import 'package:elison/Components/MyAddress.dart';
import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Components/shimmer/AddressScreenLoading.dart';
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
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Obx(() {
        return viewController.isLoading.value
            ? AddressScreenLoading()
            : viewController.addressList.isEmpty
                ? Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/location.png',
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Center(child: Text('No Address found')),
                        ),
                        MyButton(
                          title: "ADD NEW ADDRESS",
                          borderRadius: 30,
                          sizeWidth: MediaQuery.of(context).size.width * 0.8,
                          sizeHieght: 50,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black,
                          onTap: () {
                            Get.toNamed('/add-address',
                                arguments: [true, null]);
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                        )
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // InkWell(
                              //   onTap: () {
                              //     Get.toNamed('/add-address', arguments: [true, null]);
                              //     // Navigator.of(context).pushNamed(
                              //     //   AddNewAddressScreen.routeName,
                              //     // );
                              //   },
                              //   child: Row(
                              //     children: [
                              //       Icon(
                              //         Icons.add,
                              //         color: Colors.black,
                              //         size: 25,
                              //       ),
                              //       const SizedBox(width: 5),
                              //       Text(
                              //         "Add New Address",
                              //         style: TextStyle(
                              //           fontSize: 18,
                              //           color: Colors.black,
                              //           fontFamily: "Poppins",
                              //           fontWeight: FontWeight.w600,
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              const SizedBox(height: 15),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed('/add-address',
                                          arguments: [true, null]);
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
                                  SizedBox(
                                    height: 15,
                                  ),
                                  ListView.builder(
                                    itemCount:
                                        viewController.addressList.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (ctx, i) => MyAddress(
                                      address:
                                          viewController.addressList[i].address,
                                      city: viewController.addressList[i].city,
                                      name: viewController
                                          .addressList[i].fullName,
                                      phone:
                                          viewController.addressList[i].phone,
                                      state: viewController.addressList[i].town,
                                      zipcode:
                                          viewController.addressList[i].zipCode,
                                      id: i,
                                    ),
                                  ),
                                ],
                              )
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
