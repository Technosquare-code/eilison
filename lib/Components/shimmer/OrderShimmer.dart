import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

class OrderShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: 6,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (ctx, i) => Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FadeShimmer(
                  height: 8,
                  radius: 15,
                  width: size.width / 4,
                  baseColor: Colors.grey.shade500,
                  highlightColor: Colors.grey.shade300,
                ),
                FadeShimmer(
                  height: 8,
                  radius: 15,
                  width: size.width / 8,
                  baseColor: Colors.grey.shade500,
                  highlightColor: Colors.grey.shade300,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                FadeShimmer(
                  height: 80,
                  radius: 15,
                  width: size.width / 4,
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
                        width: size.width / 2.5,
                        baseColor: Colors.grey.shade500,
                        highlightColor: Colors.grey.shade300,
                      ),
                      const SizedBox(height: 20),
                      FadeShimmer(
                        height: 30,
                        radius: 25,
                        width: size.width / 4,
                        baseColor: Colors.grey.shade500,
                        highlightColor: Colors.grey.shade300,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
