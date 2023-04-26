import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatHistory extends StatelessWidget {
  String? id;

  String? orderNo;
  String? name;
  String? email;
  String? phone;
  String? message;
  String? token;
  String? status;
  DateTime? createdDate;
  String? closeDate;
  ChatHistory(
      {this.closeDate,
      this.createdDate,
      this.email,
      this.id,
      this.message,
      this.name,
      this.orderNo,
      this.token,
      this.phone,
      this.status});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 13),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message ?? "How can I exchange / return my products ?",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Container(
                width: size.width - 30,
                alignment: Alignment.centerLeft,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Order $orderNo",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                        height: 12,
                        child: VerticalDivider(
                          width: 2,
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Token Id $token",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                        height: 12,
                        child: VerticalDivider(
                          width: 2,
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        DateFormat('dd MMM y, hh:mm a').format(createdDate!) ??
                            "19 Mar 2023, 06:57 pm",
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
              const SizedBox(height: 2),
              status == '0'
                  ? Text(
                      "Pending",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  : status == '1'
                      ? Text(
                          "Processing",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.green,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      : Row(
                          children: [
                            Icon(
                              Icons.sms_outlined,
                              color: Colors.black,
                              size: 10,
                            ),
                            const SizedBox(width: 10),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Closed on $closeDate",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.green,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
            ],
          ),
        ),
        const SizedBox(height: 13),
        Divider(color: Colors.grey),
      ],
    );
  }
}
