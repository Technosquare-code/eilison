import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CoachPrivacyPolicyShimmer extends StatelessWidget {
  const CoachPrivacyPolicyShimmer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _buildShimmerBox(),
          SizedBox(height: 10),
          _buildShimmerBox(),
          SizedBox(height: 10),
          _buildShimmerBox(),
          SizedBox(height: 10),
          _buildShimmerBox(),
        ],
      ),
    );
  }

  Widget _buildShimmerBox() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
