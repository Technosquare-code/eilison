import 'package:elison/Components/InputFeild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatelessWidget {
  static const routeName = "AddPostScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Post",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.near_me_outlined,
              color: Colors.black87,
              size: 25,
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputField(
              maxLine: 10,
              minLine: 6,
              size: 30,
              fontSize: 14,
              hint: "How was your training today ?",
              borderColor: Colors.white,
              color: Colors.white,
            ),
            const SizedBox(height: 15),
            InputField(
              size: 30,
              fontSize: 14,
              hint: "#Tags your topic in here",
              borderColor: Colors.white,
              color: Colors.white,
            ),
            const SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.only(left: 15),
              color: Colors.grey.shade200,
              padding: const EdgeInsets.all(15),
              child: Icon(
                Icons.add_a_photo,
                color: Colors.black,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
