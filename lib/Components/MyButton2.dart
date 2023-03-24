import 'package:elison/Utils/Colors.dart';
import 'package:flutter/material.dart';

class MyButton2 extends StatelessWidget {
  final String? title;
  final Function()? onTap;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? sizeHieght;
  final double? sizeWidth;
  final double? fontSize;
  final double? borderRadius;
  final double? elevation;
  final FontWeight? fontWeight;
  final double? iconSize;
  final Color? iconColor;
  final String? iconType;
  final IconData? icon;
  final String? image;

  const MyButton2({
    this.title,
    this.color,
    this.onTap,
    this.sizeHieght,
    this.sizeWidth,
    this.fontSize,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.elevation,
    this.textColor,
    this.fontWeight,
    this.iconColor,
    this.iconSize,
    this.iconType,
    this.icon,
    this.image,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        disabledBackgroundColor: color ?? primaryColor,
        backgroundColor: color ?? primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 20),
          side: BorderSide(
            color: borderColor ?? color ?? Colors.transparent,
            width: borderWidth ?? 1,
          ),
        ),
        fixedSize: Size(
          sizeWidth ?? MediaQuery.of(context).size.width,
          sizeHieght ?? 45,
        ),
        minimumSize: Size(
          sizeWidth ?? MediaQuery.of(context).size.width,
          sizeHieght ?? 45,
        ),
        maximumSize: Size(
          sizeWidth ?? MediaQuery.of(context).size.width,
          sizeHieght ?? 45,
        ),
      ),
      icon: image == null
          ? Icon(
              icon,
              size: iconSize,
              color: iconColor ?? textColor ?? Colors.white,
            )
          : ImageIcon(
              AssetImage(image!),
              size: iconSize,
              color: iconColor ?? textColor ?? Colors.white,
            ),
      onPressed: onTap,
      label: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          "$title",
          style: TextStyle(
            fontSize: fontSize ?? 16,
            color: color != null ? textColor ?? Colors.white : Colors.white,
            fontFamily: "Montserrat",
            fontWeight: fontWeight ?? FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
