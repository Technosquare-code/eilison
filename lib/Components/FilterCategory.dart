import 'package:elison/Utils/Colors.dart';
import 'package:flutter/material.dart';

class FilterCategory extends StatefulWidget {
  @override
  _FilterCategoryState createState() => _FilterCategoryState();
}

class _FilterCategoryState extends State<FilterCategory> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade400, width: 0.8),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        dense: true,
        leading: Image.asset(
          "assets/images/category.png",
          width: 50,
          height: 40,
          fit: BoxFit.fill,
        ),
        title: Text(
          "Resistance Band",
          style: TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
          ),
        ),
        // subtitle: Text(
        //   "8 Categories",
        //   style: TextStyle(
        //     fontSize: 10,
        //     color: Colors.black,
        //     fontFamily: "Poppins",
        //     fontWeight: FontWeight.w400,
        //   ),
        // ),
        trailing: Checkbox(
          value: isCheck,
          onChanged: (s) {
            isCheck = s!;
            setState(() {});
          },
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
    );
  }
}
