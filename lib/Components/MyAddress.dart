import 'package:elison/Components/deletePopup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/customer/profile/address/view_address_controller.dart';

class MyAddress extends StatelessWidget {
  String? name, address, city, state, zipcode, phone;
  int? id;
  MyAddress(
      {this.name,
      this.address,
      this.city,
      this.phone,
      this.state,
      this.id,
      this.zipcode});
  final viewController = Get.find<ViewAddressController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name!,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            address! + ' ' + state!,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "$city, $zipcode",
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            "Contact Number: $phone",
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          Divider(color: Colors.grey),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed('/add-address', arguments: [false, id]);
                },
                child: Text(
                  "Edit",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return DeleteConfirmationPopup();
                    },
                  ).then((value) async {
                    if (value != null && value) {
                      print('object');
                      await viewController.deleteAdress(
                          viewController.addressList[id!].id, context);
                    } else {
                      // Delete canceled
                      // ...
                      // Get.back();
                    }
                  });

                  // await viewController.deleteAdress(
                  //     viewController.addressList[id!].id, context);
                  // viewController.isLoading(false);
                },
                child: Text(
                  "Delete",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
