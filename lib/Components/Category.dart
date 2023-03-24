import 'package:elison/Components/SubCategories.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool showSub = false;
  final List<Map<String, dynamic>> subCategories = [
    {'image': 'assets/images/salad.png', 'title': 'Salad'},
    {'image': 'assets/images/cake.png', 'title': 'Cake'},
    {'image': 'assets/images/pie.png', 'title': 'Pie'},
    {'image': 'assets/images/smoothie.png', 'title': 'Smoothie'},
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: Offset(2, 0),
                color: Colors.grey.shade100,
                blurRadius: 1,
                spreadRadius: 1.5,
              ),
              BoxShadow(
                offset: Offset(0, 2),
                color: Colors.grey.shade100,
                blurRadius: 1,
                spreadRadius: 1.5,
              ),
            ],
          ),
          child: ListTile(
            leading: Image.asset(
              "assets/images/category.png",
              width: 50,
              height: 40,
              fit: BoxFit.fill,
            ),
            title: Text(
              "Resistance Band",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              "8 Categories",
              style: TextStyle(
                fontSize: 10,
                color: Colors.black,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: InkWell(
              onTap: () {
                showSub = !showSub;
                setState(() {});
              },
              child: Container(
                width: size.width / 3.5,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: FittedBox(
                        child: Text(
                          "Sub Categories",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      showSub
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 12,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (showSub) const SizedBox(height: 15),
        if (showSub)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 10,
              children: List.generate(
                subCategories.length,
                (index) => SubCategories(
                  image: subCategories[index]['image'],
                  title: subCategories[index]['title'],
                ),
              ),
            ),
          ),
        if (showSub) const SizedBox(height: 15),
      ],
    );
  }
}
