import 'dart:math';

import 'package:elison/Screens/ProductDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Utils/text_theme.dart';

class ProductCard extends StatefulWidget {
  final String title;
  final String productId;
  final String imagePath;
  final double price;
  final Color color;
  final bool? isFavourite;
  final Function() onTap;

  const ProductCard({
    required this.title,
    required this.imagePath,
    required this.price,
    required this.color,
    required this.onTap,
    required this.productId,
    this.isFavourite,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final Random _random = Random();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Get.toNamed(
          '/product-detail-screen',
          arguments: [widget.productId],
        );
        // Navigator.of(context).pushNamed(
        //   ProductDetailScreen.routeName,
        // );
      },
      child: Container(
        width: size.width * 0.42,
        child: Card(
          color: widget.color,
          // color: Colors.primaries[_random.nextInt(Colors.primaries.length)],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      widget.imagePath,
                      height: 90,
                      width: 120,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.title,
                      style: CustomTextTheme.primary.bodyText2,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$ ${NumberFormat("#,##0.0").format(widget.price)}',
                      style: CustomTextTheme.primary.headline5,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: -1.7,
                right: -2,
                child: IconButton(
                  icon: widget.isFavourite!
                      ? const Icon(Icons.favorite_rounded,
                          color: Colors.red, size: 20)
                      : const Icon(Icons.favorite_border,
                          color: Colors.red, size: 20),
                  onPressed: widget.onTap,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
