import 'package:elison/Components/TrainerPastSession.dart';
import 'package:flutter/material.dart';

class TrainerPastSessionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (ctx, i) => TrainerPastSession(),
    );
  }
}
