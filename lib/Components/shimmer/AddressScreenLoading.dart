import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

class AddressScreenLoading extends StatelessWidget {
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
            FadeShimmer(
              height: 8,
              radius: 15,
              width: size.width / 2.5,
              baseColor: Colors.grey.shade500,
              highlightColor: Colors.grey.shade300,
            ),
            const SizedBox(height: 25),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, i) => Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15),
                ),
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
                    const SizedBox(height: 15),
                    FadeShimmer(
                      height: 8,
                      radius: 15,
                      width: size.width / 5,
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 45),
                    FadeShimmer(
                      height: 8,
                      radius: 15,
                      width: size.width / 3.5,
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 15),
                    FadeShimmer(
                      height: 8,
                      radius: 15,
                      width: size.width / 2,
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
                          width: size.width / 7,
                          baseColor: Colors.grey.shade500,
                          highlightColor: Colors.grey.shade300,
                        ),
                        FadeShimmer(
                          height: 8,
                          radius: 15,
                          width: size.width / 7,
                          baseColor: Colors.grey.shade500,
                          highlightColor: Colors.grey.shade300,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
