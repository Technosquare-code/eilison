import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

class CartScreenShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              FadeShimmer(
                height: 45,
                radius: 5,
                width: 45,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              ),
              const SizedBox(width: 15),
              Expanded(child: Divider(thickness: 1)),
              const SizedBox(width: 15),
              FadeShimmer(
                height: 45,
                radius: 5,
                width: 45,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              ),
            ],
          ),
          const SizedBox(height: 15),
          Divider(thickness: 1),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              shrinkWrap: true,
              itemBuilder: (ctx, i) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      FadeShimmer(
                        radius: 5,
                        height: 100,
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
                              width: size.width / 2,
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
                            const SizedBox(height: 10),
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
                                  width: 30,
                                  baseColor: Colors.grey.shade500,
                                  highlightColor: Colors.grey.shade300,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Divider(thickness: 1),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FadeShimmer(
                        height: 8,
                        radius: 15,
                        width: size.width / 3,
                        baseColor: Colors.grey.shade500,
                        highlightColor: Colors.grey.shade300,
                      ),
                      SizedBox(
                        width: 4,
                        height: 25,
                        child: VerticalDivider(thickness: 2),
                      ),
                      FadeShimmer(
                        height: 8,
                        radius: 15,
                        width: size.width / 3,
                        baseColor: Colors.grey.shade500,
                        highlightColor: Colors.grey.shade300,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Divider(thickness: 1),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Divider(thickness: 3),
          const SizedBox(height: 15),
          FadeShimmer(
            height: 8,
            radius: 15,
            width: size.width / 3,
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 15),
          Divider(thickness: 1),
          const SizedBox(height: 15),
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
                width: size.width / 3,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              ),
            ],
          ),
          const SizedBox(height: 15),
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
          const SizedBox(height: 15),
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
                height: 40,
                radius: 5,
                width: size.width / 2.5,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              ),
            ],
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
