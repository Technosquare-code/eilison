import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
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
                  height: 70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Huawei Matebook X 13",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "\$1299",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            "\$1400",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.black,
                              decorationThickness: 1.5,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                padding: const EdgeInsets.all(5),
                child: Text(
                  "QTY : 1",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Divider(color: Colors.grey),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: size.width / 2.5,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Remove",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Container(
                height: 20,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  border: Border(left: BorderSide(color: Colors.grey)),
                ),
              ),
              SizedBox(
                width: size.width / 2.5,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Move to Wishlist",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )
            ],
          ),
          Divider(color: Colors.grey),
        ],
      ),
    );
  }
}
