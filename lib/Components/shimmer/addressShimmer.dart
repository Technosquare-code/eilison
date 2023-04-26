import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AddressShimmer extends StatelessWidget {
  const AddressShimmer({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(
        colors: [
          Colors.grey[200]!,
          Colors.grey[300]!,
          Colors.grey[200]!,
        ],
        begin: Alignment(-1.0, -0.5),
        end: Alignment(1.0, 0.5),
        stops: [0.0, 0.5, 1.0],
        tileMode: TileMode.clamp,
      ),
      // period: Duration(seconds: 2),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.3,
              color: Colors.grey[300],
            ),
            SizedBox(height: 20),
            Container(
              height: size.height * 0.3,
              color: Colors.grey[300],
            ),
            SizedBox(height: 20),
            Container(
              height: size.height * 0.3,
              color: Colors.grey[300],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
