import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SubCategories extends StatelessWidget {
  final String image;
  final String title;

  const SubCategories({
    required this.image,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 45,
      backgroundColor: Colors.pink.shade100,
      child: Column(
        children: [
          const SizedBox(height: 15),
          CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: CachedNetworkImage(
                imageUrl: image,
                width: 25,
                height: 25,
                fit: BoxFit.fill,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              )
              // Image.network(
              //   image,
              //   width: 25,
              //   height: 25,
              //   fit: BoxFit.fill,
              // ),
              ),
          const SizedBox(height: 5),
          SizedBox(
            width: 45,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
