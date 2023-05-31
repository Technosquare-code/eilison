import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

class ProductDetailShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          FadeShimmer(
            radius: 15,
            width: size.width,
            height: size.height / 4,
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FadeShimmer(
                radius: 10,
                width: size.width / 4,
                height: size.width / 4,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              ),
              FadeShimmer(
                radius: 10,
                width: size.width / 4,
                height: size.width / 4,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              ),
              FadeShimmer(
                radius: 10,
                width: size.width / 4,
                height: size.width / 4,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FadeShimmer(
                height: 8,
                radius: 15,
                width: size.width / 2,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              ),
              FadeShimmer(
                height: 8,
                radius: 15,
                width: 50,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              ),
            ],
          ),
          const SizedBox(height: 10),
          FadeShimmer(
            height: 8,
            radius: 15,
            width: size.width / 3.5,
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 10),
          FadeShimmer(
            height: 8,
            radius: 15,
            width: size.width / 3,
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 35),
          FadeShimmer(
            height: 8,
            radius: 15,
            width: size.width / 2,
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 15),
          FadeShimmer(
            height: 8,
            radius: 15,
            width: size.width,
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 10),
          FadeShimmer(
            height: 8,
            radius: 15,
            width: size.width,
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 10),
          FadeShimmer(
            height: 8,
            radius: 15,
            width: size.width,
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 10),
          FadeShimmer(
            height: 8,
            radius: 15,
            width: size.width,
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 10),
          FadeShimmer(
            height: 8,
            radius: 15,
            width: size.width,
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 10),
          FadeShimmer(
            height: 8,
            radius: 15,
            width: size.width / 3,
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 30),
          FadeShimmer(
            height: 60,
            radius: 5,
            width: size.width,
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 30),
          FadeShimmer(
            height: 8,
            radius: 15,
            width: size.width / 2,
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 25),
          FadeShimmer(
            radius: 15,
            width: size.width,
            height: size.height / 5,
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
