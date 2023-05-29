import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Components/shimmer/addressShimmer.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/controllers/customer/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/customer/profile/address/view_address_controller.dart';

class AddressPart extends StatefulWidget {
  @override
  _AddressPartState createState() => _AddressPartState();
}

class _AddressPartState extends State<AddressPart> {
  final viewController = Get.find<ViewAddressController>();
  final cartController = Get.find<CartController>();

  String selectedAddress = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(() {
      return Container(
        child: viewController.isLoading.value
            ? AddressShimmer(
                size: MediaQuery.of(context).size,
              )
            : viewController.addressList.isEmpty
                ? AddressNotFoundAtCart(size: size)
                : ListView.builder(
                    itemCount: viewController.addressList.length,
                    shrinkWrap: true,
                    itemBuilder: (ctx, i) => SelectAddress(
                      id: viewController.addressList[i].id,
                      index: i.toString(),
                      title: viewController.addressList[i].fullName,
                      des: viewController.addressList[i].address +
                          ' ' +
                          viewController.addressList[i].landmark +
                          ' ' +
                          viewController.addressList[i].town +
                          ' ' +
                          viewController.addressList[i].city +
                          ' ' +
                          viewController.addressList[i].zipCode +
                          // ' ' +
                          // viewController.addressList[i].state
                          // +
                          ' ' +
                          viewController.addressList[i].alternateNumber,
                      selectedIndex: selectedAddress,
                      onTap: () {
                        selectedAddress = i.toString();
                        cartController.addressId.value =
                            viewController.addressList[i].id;
                        print(cartController.addressId.value);
                        setState(() {});
                      },
                    ),
                  ),
      );
    });
  }
}

class AddressNotFoundAtCart extends StatelessWidget {
  const AddressNotFoundAtCart({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/location.png', height: size.height * 0.15),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('No Address Found'),
          ),
          MyButton(
            title: "ADD ADDRESS",
            borderRadius: 5,
            sizeWidth: size.width / 2.5,
            sizeHieght: 40,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.black,
            onTap: () {
              Get.toNamed('/add-address', arguments: [true, null]);
            },
          ),
          SizedBox(
            height: size.height * 0.1,
          )
        ],
      ),
    );
  }
}

class SelectAddress extends StatelessWidget {
  final String index;
  final String title;
  final String id;
  final String des;
  final String selectedIndex;
  final VoidCallback onTap;

  const SelectAddress({
    required this.index,
    required this.title,
    required this.selectedIndex,
    required this.id,
    required this.des,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Transform(
            transform: Matrix4.translationValues(-10, 0, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform(
                  transform: Matrix4.translationValues(0, -10, 0),
                  child: Checkbox(
                    value: index == selectedIndex ? true : false,
                    onChanged: (_) => onTap(),
                    activeColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.blueGrey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: onTap,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // "Manoj Saini",
                          title,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          des,
                          // "Technosquare IT Solution Private Limited, Near Bahagat Singh Circle, Pliani, 333031, Rajestan",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Divider(color: Colors.grey),
        ],
      ),
    );
  }
}
