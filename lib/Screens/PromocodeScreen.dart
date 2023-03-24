import 'package:elison/Components/Promocode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PromocodeScreen extends StatelessWidget {
  static const routeName = "PromocodeScreen";
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
          "Promocode",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 5),
        child: ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, i) {
            if (i == 0) {
              return Promocode(applied: false);
            } else {
              return Promocode(applied: true);
            }
          },
        ),
      ),
    );
  }
}
