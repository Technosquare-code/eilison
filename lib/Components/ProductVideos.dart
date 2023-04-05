import 'package:flutter/material.dart';

class ProductVideos extends StatelessWidget {
  final String image;

  const ProductVideos(this.image);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    image,
                    width: size.width / 4,
                    height: size.width / 5,
                    fit: BoxFit.fill,
                  ),
                ),
                Icon(
                  Icons.play_circle_filled,
                  color: Colors.white,
                  size: 25,
                ),
              ],
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                "Video Title",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
