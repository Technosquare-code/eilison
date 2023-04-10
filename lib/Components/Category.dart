import 'package:elison/Components/SubCategories.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/apiServices/home_screen_service.dart';
import 'package:elison/models/subcategory_model.dart';
import 'package:elison/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/customer/home_screen_controller.dart';

class Category extends StatefulWidget {
  final String? img;
  final String? title;
  final String? count;
  final List<SubcategoryModel>? subcat;
  Category({this.img, this.title, this.count, this.subcat});
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool showSub = false;
  final homescreenController = Get.find<HomeScreenController>();
  List<SubcategoryModel> subcatlist = [];
  bool isload = false;
  // final List<Map<String, dynamic>> subCategories = [
  //   {'image': 'assets/images/salad.png', 'title': 'Salad'},
  //   {'image': 'assets/images/cake.png', 'title': 'Cake'},
  //   {'image': 'assets/images/pie.png', 'title': 'Pie'},
  //   {'image': 'assets/images/smoothie.png', 'title': 'Smoothie'},
  // ];
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

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
            leading: Image.network(
              // "assets/images/category.png",
              widget.img!,
              width: 50,
              height: 40,
              fit: BoxFit.fill,
            ),
            title: Text(
              // "Resistance Band",
              widget.title ?? "",
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
              onTap: () async {
                showSub = !showSub;
                isload = true;
                setState(() {});
                if (showSub) {
                  print('id--------${widget.count}');
                  // homescreenController.subcatId.value = widget.count ?? '0';
                  final List<SubcategoryModel> ss =
                      await HomeScreenService().subcategoryList(widget.count!);
                  isload = false;
                  setState(() {
                    subcatlist = ss;
                  });
                  // await homescreenController.getSubcategory(widget.count!);
                  // print(homescreenController.subCategoryList.length);
                }
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
          Subcategory(
            mylist: subcatlist,
            isload: isload,
          ),
        if (showSub) const SizedBox(height: 15),
      ],
    );
  }
}

class Subcategory extends StatefulWidget {
  Subcategory({Key? key, required this.mylist, this.isload = false})
      : super(key: key);
  bool isload;
  List<SubcategoryModel> mylist = [];

  @override
  State<Subcategory> createState() => _SubcategoryState();
}

class _SubcategoryState extends State<Subcategory> {
  final homescreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: widget.isload
            ? CircularProgressIndicator()
            : widget.mylist.isEmpty
                ? Text('data not found')
                : Wrap(
                    spacing: 10,
                    children: List.generate(
                      widget.mylist.length,
                      (index) => SubCategories(
                        image: mainUrl +
                            categoryUrl +
                            widget.mylist[index].categoryIcon,
                        title: widget.mylist[index].categoryName,
                      ),
                    ),
                  ));
  }
}
