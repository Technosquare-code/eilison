import 'package:elison/Components/InputFeild.dart';
import 'package:elison/Components/MyButtton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateTrainer extends StatefulWidget {
  @override
  _RateTrainerState createState() => _RateTrainerState();
}

class _RateTrainerState extends State<RateTrainer> {
  String rate = "1";
  final review = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 30),
            RatingBar.builder(
              minRating: 1,
              itemCount: 5,
              allowHalfRating: true,
              direction: Axis.horizontal,
              itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemSize: 25,
              initialRating: 1,
              onRatingUpdate: (rating) => setState(
                () => rate = rating.toStringAsFixed(0),
              ),
            ),
            const SizedBox(height: 15),
            Form(
              key: _formKey,
              child: InputField(
                minLine: 5,
                maxLine: 5,
                borderRadius: 5,
                color: Colors.white,
                borderColor: Colors.grey,
                controller: review,
                hint: "Enter Reviews",
              ),
            ),
            const SizedBox(height: 15),
            MyButton(
              title: "SUBMIT",
              fontSize: 16,
              onTap: () {},
            ),
          ],
        ),
        Container(
          height: 80,
          width: 80,
          transform: Matrix4.translationValues(0, -60, 0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: const Icon(
            Icons.star,
            color: Colors.amber,
            size: 70,
          ),
        ),
      ],
    );
  }
}
