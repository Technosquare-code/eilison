import 'package:flutter/material.dart';

class HomeCategory extends StatelessWidget {
  final String imageAsset;
  final String title;
  final VoidCallback onTap;

  const HomeCategory({
    required this.imageAsset,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.grey[200],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 13,
            vertical: 10,
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageAsset,
                  height: 70,
                  width: 85,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 8,
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
