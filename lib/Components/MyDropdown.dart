import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class MyDropdown extends StatelessWidget {
  final List? items;
  final Function(Object?) onChanged;
  final String? Function(Object?)? validator;
  final String? hint;
  final TextStyle? hintStyle;
  final IconData? icon;
  final Widget? suffix;
  final Color? color;
  final double? size;
  final double? width;
  final double? borderRadius;
  final Color? errorTextColor;
  final Color? borderColor;
  final String? value;
  final double? padding;
  final List<String>? title;
  final double? maxHeight;
  final bool? isclass;
  const MyDropdown({
    required this.items,
    required this.onChanged,
    required this.title,
    this.validator,
    this.width,
    this.borderColor,
    this.hint,
    this.hintStyle,
    this.size,
    this.suffix,
    this.icon,
    this.padding,
    this.errorTextColor,
    this.color,
    this.value,
    this.borderRadius,
    this.maxHeight,
    this.isclass = false,
  });
  @override
  Widget build(BuildContext context) {
    return isclass!
        ? DropdownButtonFormField2(
            buttonHeight: size,
            dropdownFullScreen: true,
            dropdownWidth: width,
            dropdownMaxHeight: maxHeight,
            itemPadding: EdgeInsets.zero,
            buttonPadding: EdgeInsets.zero,
            dropdownPadding: EdgeInsets.zero,
            dropdownScrollPadding: const EdgeInsets.only(left: 15),
            offset: Offset(padding != null ? -padding! : 0, -10),
            items: List.generate(
              items!.length,
              (index) => DropdownMenuItem(
                value: items![index].id,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    items![index].categoryName,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            value: value,
            onChanged: onChanged,
            validator: validator,
            isDense: true,
            isExpanded: true,
            style: const TextStyle(fontSize: 12),
            hint: hint != null
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      hint!,
                      style: hintStyle ??
                          const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                    ),
                  )
                : null,
            decoration: InputDecoration(
              isDense: true,
              prefixIcon: icon != null ? Icon(icon, color: Colors.grey) : null,
              suffixIcon: suffix,
              filled: true,
              fillColor: color,
              suffixIconConstraints: BoxConstraints(
                maxHeight: size ?? 35,
                minHeight: size ?? 35,
                maxWidth: size == null ? 38 : (size! + 3),
                minWidth: size == null ? 38 : (size! + 3),
              ),
              prefixIconConstraints: BoxConstraints(
                maxHeight: size ?? 35,
                minHeight: size ?? 35,
                maxWidth: size == null ? 38 : (size! + 3),
                minWidth: size == null ? 38 : (size! + 3),
              ),
              contentPadding: EdgeInsets.only(
                top: icon == null
                    ? suffix == null
                        ? size == null
                            ? 19
                            : (size! / 1.5)
                        : 0
                    : 0,
                bottom: icon == null
                    ? suffix == null
                        ? size == null
                            ? 19
                            : (size! / 1.5)
                        : 0
                    : 0,
                right: 0,
                left: icon == null ? 15 : 0,
              ),
              errorStyle: errorTextColor != null
                  ? TextStyle(color: errorTextColor)
                  : const TextStyle(color: Colors.red),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 25),
                borderSide: borderColor != null
                    ? BorderSide(color: borderColor!)
                    : const BorderSide(color: Colors.transparent),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 25),
                borderSide: borderColor != null
                    ? BorderSide(color: borderColor!)
                    : const BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 25),
                borderSide: borderColor != null
                    ? BorderSide(color: borderColor!)
                    : const BorderSide(color: Colors.transparent),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 25),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 25),
                borderSide: borderColor != null
                    ? BorderSide(color: borderColor!)
                    : const BorderSide(color: Colors.transparent),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 25),
                borderSide: const BorderSide(color: Colors.red),
              ),
            ),
          )
        : DropdownButtonFormField2<Object?>(
            buttonHeight: size,
            dropdownFullScreen: true,
            dropdownWidth: width,
            dropdownMaxHeight: maxHeight,
            itemPadding: EdgeInsets.zero,
            buttonPadding: EdgeInsets.zero,
            dropdownPadding: EdgeInsets.zero,
            dropdownScrollPadding: const EdgeInsets.only(left: 15),
            offset: Offset(padding != null ? -padding! : 0, -10),
            items: List.generate(
              items!.length,
              (index) => DropdownMenuItem(
                value: items![index],
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    title![index],
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            value: value,
            onChanged: onChanged,
            validator: validator,
            isDense: true,
            isExpanded: true,
            style: const TextStyle(fontSize: 12),
            hint: hint != null
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      hint!,
                      style: hintStyle ??
                          const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                    ),
                  )
                : null,
            decoration: InputDecoration(
              isDense: true,
              prefixIcon: icon != null ? Icon(icon, color: Colors.grey) : null,
              suffixIcon: suffix,
              filled: true,
              fillColor: color,
              suffixIconConstraints: BoxConstraints(
                maxHeight: size ?? 35,
                minHeight: size ?? 35,
                maxWidth: size == null ? 38 : (size! + 3),
                minWidth: size == null ? 38 : (size! + 3),
              ),
              prefixIconConstraints: BoxConstraints(
                maxHeight: size ?? 35,
                minHeight: size ?? 35,
                maxWidth: size == null ? 38 : (size! + 3),
                minWidth: size == null ? 38 : (size! + 3),
              ),
              contentPadding: EdgeInsets.only(
                top: icon == null
                    ? suffix == null
                        ? size == null
                            ? 19
                            : (size! / 1.5)
                        : 0
                    : 0,
                bottom: icon == null
                    ? suffix == null
                        ? size == null
                            ? 19
                            : (size! / 1.5)
                        : 0
                    : 0,
                right: 0,
                left: icon == null ? 15 : 0,
              ),
              errorStyle: errorTextColor != null
                  ? TextStyle(color: errorTextColor)
                  : const TextStyle(color: Colors.red),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 25),
                borderSide: borderColor != null
                    ? BorderSide(color: borderColor!)
                    : const BorderSide(color: Colors.transparent),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 25),
                borderSide: borderColor != null
                    ? BorderSide(color: borderColor!)
                    : const BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 25),
                borderSide: borderColor != null
                    ? BorderSide(color: borderColor!)
                    : const BorderSide(color: Colors.transparent),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 25),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 25),
                borderSide: borderColor != null
                    ? BorderSide(color: borderColor!)
                    : const BorderSide(color: Colors.transparent),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 25),
                borderSide: const BorderSide(color: Colors.red),
              ),
            ),
          );
  }
}
