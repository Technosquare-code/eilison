import 'package:elison/Components/InputFeild.dart';
import 'package:elison/Components/MyButtton.dart';
import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 15, 25, 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 12,
              width: size.width / 6,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            "Send message us",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 15),
          InputField(
            size: 30,
            hint: "Enter Name",
            borderRadius: 10,
            type: TextInputType.name,
            color: Colors.grey.shade50,
            borderColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 15),
          InputField(
            size: 30,
            hint: "Enter Phone",
            borderRadius: 10,
            type: TextInputType.phone,
            color: Colors.grey.shade50,
            borderColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 15),
          InputField(
            size: 30,
            borderRadius: 10,
            hint: "Enter Email",
            color: Colors.grey.shade50,
            type: TextInputType.emailAddress,
            borderColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 15),
          InputField(
            size: 30,
            minLine: 8,
            maxLine: 8,
            borderRadius: 10,
            hint: "Enter Message",
            type: TextInputType.name,
            borderColor: Colors.grey.shade300,
            color: Colors.grey.shade50,
          ),
          const SizedBox(height: 25),
          MyButton(
            fontSize: 16,
            title: "Submit",
            fontWeight: FontWeight.w700,
            textColor: Colors.white,
            sizeHieght: 50,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
