import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

class SessionScreenLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: FadeShimmer(
              height: 8,
              radius: 15,
              width: size.width / 1.5,
              baseColor: Colors.grey.shade500,
              highlightColor: Colors.grey.shade300,
            ),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FadeShimmer.round(
                size: 70,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeShimmer(
                      height: 8,
                      radius: 15,
                      width: size.width / 4,
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
                    const SizedBox(height: 15),
                    FadeShimmer(
                      height: 8,
                      radius: 15,
                      width: size.width / 4,
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: 60,
            height: 45,
            child: VerticalDivider(thickness: 3),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FadeShimmer.round(
                size: 70,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeShimmer(
                      height: 8,
                      radius: 15,
                      width: size.width / 4,
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
                    const SizedBox(height: 15),
                    FadeShimmer(
                      height: 8,
                      radius: 15,
                      width: size.width / 4,
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: 60,
            height: 45,
            child: VerticalDivider(thickness: 3),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FadeShimmer.round(
                size: 70,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeShimmer(
                      height: 8,
                      radius: 15,
                      width: size.width / 4,
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
                    const SizedBox(height: 15),
                    FadeShimmer(
                      height: 8,
                      radius: 15,
                      width: size.width / 4,
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: FadeShimmer(
              height: 8,
              radius: 15,
              width: size.width / 1.5,
              baseColor: Colors.grey.shade500,
              highlightColor: Colors.grey.shade300,
            ),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FadeShimmer.round(
                size: 70,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeShimmer(
                      height: 8,
                      radius: 15,
                      width: size.width / 4,
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
                    const SizedBox(height: 15),
                    FadeShimmer(
                      height: 8,
                      radius: 15,
                      width: size.width / 4,
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: 60,
            height: 45,
            child: VerticalDivider(thickness: 3),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FadeShimmer.round(
                size: 70,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeShimmer(
                      height: 8,
                      radius: 15,
                      width: size.width / 4,
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
                    const SizedBox(height: 15),
                    FadeShimmer(
                      height: 8,
                      radius: 15,
                      width: size.width / 4,
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: 60,
            height: 45,
            child: VerticalDivider(thickness: 3),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FadeShimmer.round(
                size: 70,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeShimmer(
                      height: 8,
                      radius: 15,
                      width: size.width / 4,
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
                    const SizedBox(height: 15),
                    FadeShimmer(
                      height: 8,
                      radius: 15,
                      width: size.width / 4,
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
