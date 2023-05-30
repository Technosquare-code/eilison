import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

class CartAddressListLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListView.builder(
        itemCount: 7,
        shrinkWrap: true,
        itemBuilder: (ctx, i) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FadeShimmer(
                  height: 20,
                  radius: 2,
                  width: 20,
                  baseColor: Colors.grey.shade500,
                  highlightColor: Colors.grey.shade300,
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: FadeShimmer(
                    height: 8,
                    radius: 15,
                    width: size.width,
                    baseColor: Colors.grey.shade500,
                    highlightColor: Colors.grey.shade300,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            FadeShimmer(
              height: 8,
              radius: 15,
              width: size.width,
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
          ],
        ),
      ),
    );
  }
}
