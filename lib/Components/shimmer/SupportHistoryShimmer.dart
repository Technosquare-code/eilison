import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

class SupportHistoryShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(25),
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (ctx, i) => Column(
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
            Divider(thickness: 1, color: Colors.grey),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
