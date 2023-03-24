import 'package:elison/Components/TrainerScheduleSession.dart';
import 'package:flutter/material.dart';

class TrainerScheduleSessionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (ctx, i) => TrainerScheduleSession(),
    );
  }
}
