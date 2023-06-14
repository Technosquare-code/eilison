import 'package:cached_network_image/cached_network_image.dart';
import 'package:elison/Components/viewImage.dart';
import 'package:flutter/material.dart';

class productmoreimage extends StatelessWidget {
  final String imageAsset;
  final String title;
  // final VoidCallback onTap;

  const productmoreimage({
    required this.imageAsset,
    required this.title,
    // required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: 100,
      child: SizedBox(
        width: size.width / 1.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: imageAsset,
                width: size.width / 4,
                height: size.width / 4,
                fit: BoxFit.fill,
                placeholder: (context, url) => Container(
                  width: size.width / 4,
                  height: size.width / 4,
                  alignment: Alignment.center,
                  color: Colors.grey.shade200,
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              // Image.network(
              //   imageAsset,
              //   width: size.width / 4,
              //   height: size.width / 4,
              //   fit: BoxFit.fill,
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
