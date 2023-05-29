import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

class CommunityShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FadeShimmer(
                  height: 40,
                  radius: 15,
                  width: size.width / 4.5,
                  baseColor: Colors.grey.shade500,
                  highlightColor: Colors.grey.shade300,
                ),
                const SizedBox(width: 15),
                FadeShimmer(
                  height: 40,
                  radius: 15,
                  width: size.width / 4.5,
                  baseColor: Colors.grey.shade500,
                  highlightColor: Colors.grey.shade300,
                ),
              ],
            ),
            const SizedBox(height: 25),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, i) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      FadeShimmer.round(
                        size: 45,
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
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      FadeShimmer(
                        height: 8,
                        radius: 15,
                        width: 30,
                        baseColor: Colors.grey.shade500,
                        highlightColor: Colors.grey.shade300,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  FadeShimmer(
                    radius: 15,
                    width: size.width,
                    height: size.height / 4,
                    baseColor: Colors.grey.shade500,
                    highlightColor: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 10),
                  Divider(thickness: 1),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
