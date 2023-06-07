import 'package:cached_network_image/cached_network_image.dart';
import 'package:elison/Components/Help.dart';
import 'package:elison/Components/MyButton2.dart';
import 'package:elison/Screens/OrderDetailScreen.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/Utils/Utils.dart';
import 'package:elison/urls.dart';
import 'package:flutter/material.dart';

class Order extends StatelessWidget {
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
  String? status;

  Order(
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
      this.zipCode,
      this.status});

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    var size = MediaQuery.of(context).size;
    if (status == '0') {
      status = 'Pending';
      statusColor = Colors.red;
    } else if (status == '1') {
      status = 'Processing';
      statusColor = Colors.yellow;
    } else if (status == '2') {
      status = 'Shipped';
      statusColor = Colors.green;
    } else if (status == '3') {
      status = 'Delivered';
      statusColor = Colors.green;
    } else if (status == '4') {
      status = 'Cancelled by User';
      statusColor = Colors.red;
    } else if (status == '5') {
      status = 'Cancelled by Admin';
      statusColor = Colors.red;
    } else {
      status = 'Payment Failed';
      statusColor = Colors.red;
    }
    return InkWell(
      onTap: () {
        // Navigator.of(context).pushNamed(.routeName);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderDetailScreen(
                status: status,
                statusColor: statusColor,
                address: address,
                alternateNumber: alternateNumber,
                city: city,
                country: country,
                createdDate: createdDate,
                email: email,
                fullName: fullName,
                id: id,
                itemName: itemName,
                landmark: landmark,
                orderNo: orderNo,
                payableAmount: payableAmount,
                phone: phone,
                state: state,
                thumbnail: thumbnail,
                town: town,
                transactionNo: transactionNo,
                zipCode: zipCode,
              ),
            ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade50,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${orderNo}",
                  // "ORDER ${orderNo}",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "${status}",
                  // "ORDER ${orderNo}",
                  style: TextStyle(
                    fontSize: 14,
                    color: statusColor,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl: mainUrl + specialItemUrl + thumbnail!,
                  width: size.width / 5,
                  height: 80,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                // Image.network(
                //   // "assets/images/laptop.png",
                //   mainUrl + specialItemUrl + thumbnail!,
                //   width: size.width / 5,
                //   height: 80,
                //   fit: BoxFit.fill,
                // ),
                SizedBox(width: 15),
                Expanded(
                  child: SizedBox(
                    height: 75,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // "Huawei Matebook X 13",
                          itemName!,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        MyButton2(
                          title: "Help",
                          icon: Icons.question_mark,
                          color: Colors.blueGrey.shade50,
                          borderColor: primaryColor,
                          textColor: primaryColor,
                          borderRadius: 15,
                          fontSize: 12,
                          iconSize: 15,
                          sizeWidth: size.width / 4,
                          sizeHieght: 30,
                          onTap: () {
                            Utils.showMyBottomSheet(
                                context,
                                Help(
                                  orderId: id,
                                ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
