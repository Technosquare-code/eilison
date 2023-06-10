import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

class AllSessionListShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (ctx, i) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          if (i != 9)
            SizedBox(
              width: 60,
              height: 45,
              child: VerticalDivider(thickness: 3),
            ),
        ],
      ),
    );
  }
}
