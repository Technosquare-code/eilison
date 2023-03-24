import 'package:elison/Components/Post.dart';
import 'package:elison/Screens/AddPostScreen.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Eilison Community",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (ctx, i) => Post(true),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn2",
        onPressed: () {
          Navigator.of(context).pushNamed(AddPostScreen.routeName);
        },
        elevation: 8,
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: primaryColor,
          size: 30,
        ),
      ),
    );
  }
}
