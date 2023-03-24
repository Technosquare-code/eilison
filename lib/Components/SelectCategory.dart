import 'package:elison/Utils/Colors.dart';
import 'package:flutter/material.dart';

class SelectCategory extends StatelessWidget {
  final String? id;
  final String? title;
  final Color? color;
  final String? selected;
  final Color? borderColor;
  final Function()? onTap;

  const SelectCategory({
    this.id,
    this.title,
    this.selected,
    this.onTap,
    this.color,
    this.borderColor,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          border: id == selected
              ? null
              : Border.all(color: borderColor ?? primaryColor),
          color: id == selected ? color ?? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          "$title",
          style: TextStyle(
            fontSize: 14,
            color: id == selected ? Colors.white : borderColor ?? primaryColor,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
