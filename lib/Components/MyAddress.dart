import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAddress extends StatelessWidget {
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
            "Manoj",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Test jdkfdj Rajasthan",
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Jhujhuna, 333031",
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            "Contact Number: 8243546475",
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
                  Get.toNamed('/add-address', arguments: false);
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
              Text(
                "Delete",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
