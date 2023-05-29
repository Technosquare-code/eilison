import 'package:elison/package%20edit/responsive_grid_list.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

class ItemListLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ResponsiveGridList(
      shrinkWrap: true,
      verticalGridMargin: 15,
      horizontalGridMargin: 15,
      minItemWidth: size.width / 2.5,
      children: List.generate(
        12,
        (i) => Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: FadeShimmer(
                  radius: 0,
                  width: size.width / 2,
                  height: size.height / 6,
                  baseColor: Colors.grey.shade500,
                  highlightColor: Colors.grey.shade300,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 8,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeShimmer(
                      height: 8,
                      radius: 10,
                      width: size.width / 4,
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 8),
                    FadeShimmer(
                      height: 8,
                      radius: 10,
                      width: size.width / 6,
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.grey.shade300,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
