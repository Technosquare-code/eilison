import 'dart:math' as math;

import 'package:elison/Components/SelectCategory.dart';
import 'package:elison/Components/Sessions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllSessionScreen extends StatefulWidget {
  static const routeName = "AllSessionScreen";
  @override
  State<AllSessionScreen> createState() => _AllSessionScreenState();
}

class _AllSessionScreenState extends State<AllSessionScreen> {
  late String title;
  late String type;
  String selectedCategory = "0";
  List categories = [
    'All',
    'Low Workout',
    'Hard Workout',
    'Lowerbody Workout',
    'Fullbody Workout',
  ];

  @override
  void didChangeDependencies() {
    Map arg = ModalRoute.of(context)!.settings.arguments as Map;
    title = arg['title'];
    type = arg['type'];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(25, 15, 25, 10),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 10,
                children: List.generate(
                  categories.length,
                  (index) => SelectCategory(
                    id: index.toString(),
                    title: categories[index],
                    selected: selectedCategory,
                    onTap: () {
                      selectedCategory = index.toString();
                      setState(() {});
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, i) {
                if (i == 3) {
                  return Session(
                    showDivider: false,
                    color: Colors.primaries[
                        math.Random().nextInt(Colors.primaries.length)],
                  );
                } else {
                  return Session(
                    showDivider: true,
                    color: Colors.primaries[
                        math.Random().nextInt(Colors.primaries.length)],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
