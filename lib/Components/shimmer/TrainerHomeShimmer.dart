import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

class TrainerHomeShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FadeShimmer(
                height: 8,
                radius: 15,
                width: size.width / 3,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              ),
              FadeShimmer(
                height: 8,
                radius: 15,
                width: size.width / 4,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              ),
            ],
          ),
          const SizedBox(height: 10),
          FadeShimmer(
            height: 8,
            radius: 15,
            width: size.width / 4,
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
          const SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 15,
              children: List.generate(
                4,
                (index) => FadeShimmer(
                  radius: 15,
                  height: size.height / 4,
                  width: size.width / 1.5,
                  baseColor: Colors.grey.shade500,
                  highlightColor: Colors.grey.shade300,
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          FadeShimmer(
            height: 8,
            radius: 15,
            width: size.width / 2,
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 15,
              children: List.generate(
                4,
                (index) => FadeShimmer(
                  radius: 15,
                  height: size.height / 4,
                  width: size.width / 1.5,
                  baseColor: Colors.grey.shade500,
                  highlightColor: Colors.grey.shade300,
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          FadeShimmer(
            height: 8,
            radius: 15,
            width: size.width / 2,
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 15,
              children: List.generate(
                4,
                (index) => FadeShimmer(
                  radius: 15,
                  height: size.height / 4,
                  width: size.width / 1.5,
                  baseColor: Colors.grey.shade500,
                  highlightColor: Colors.grey.shade300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
