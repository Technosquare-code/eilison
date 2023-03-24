import 'package:flutter/material.dart';

class ProductVideos extends StatelessWidget {
  final String image;

  const ProductVideos(this.image);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            image,
            width: size.width / 2.5,
            height: size.height / 6,
            fit: BoxFit.fill,
          ),
        ),
        Icon(
          Icons.play_circle_filled,
          color: Colors.white,
          size: 25,
        ),
      ],
    );
  }
}
