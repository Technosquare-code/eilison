import 'dart:math';

import 'package:elison/Screens/ProductDetailScreen.dart';
import 'package:flutter/material.dart';

import '../Utils/text_theme.dart';

class FeaturedCard extends StatefulWidget {
  final String title;
  final String imagePath;
  final double price;
  final Color color;
  final bool? isFavourite;
  final Function() onTap;

  const FeaturedCard({
    required this.title,
    required this.imagePath,
    required this.price,
    required this.color,
    required this.onTap,
    this.isFavourite,
  });

  @override
  State<FeaturedCard> createState() => _FeaturedCardState();
}

class _FeaturedCardState extends State<FeaturedCard> {
  final Random _random = Random();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetailScreen.routeName,
        );
      },
      child: Card(
        color: Colors.colr[_random.nextInt(Colors.colr.length)],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Column(
                children: [
                  Image.asset(
                    widget.imagePath,
                    height: 90,
                    width: 90,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.title,
                    style: CustomTextTheme.primary.bodyText2,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$ ${widget.price}',
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
                icon: const Icon(Icons.favorite_border,
                    color: Colors.red, size: 20),
                onPressed: widget.onTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
