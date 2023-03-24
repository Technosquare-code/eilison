import 'package:elison/Components/Help.dart';
import 'package:elison/Components/MyButton2.dart';
import 'package:elison/Screens/OrderDetailScreen.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/Utils/Utils.dart';
import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(OrderDetailScreen.routeName);
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
            Text(
              "ORDER 2424343",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Image.asset(
                  "assets/images/laptop.png",
                  width: size.width / 5,
                  height: 80,
                  fit: BoxFit.fill,
                ),
                SizedBox(width: 15),
                Expanded(
                  child: SizedBox(
                    height: 75,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Huawei Matebook X 13",
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
                            Utils.showMyBottomSheet(context, Help());
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
