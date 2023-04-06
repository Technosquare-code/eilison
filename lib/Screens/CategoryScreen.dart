import 'package:elison/Components/Category.dart';
import 'package:elison/controllers/customer/home_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatefulWidget {
  static const routeName = "CategoryScreen";
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late bool showBackButton;
  final homescreenController = Get.find<HomeScreenController>();

  @override
  void didChangeDependencies() {
    var arg = ModalRoute.of(context)!.settings.arguments;
    if (arg != null) {
      showBackButton = true;
    } else {
      showBackButton = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: showBackButton
            ? IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  CupertinoIcons.back,
                  color: Colors.black,
                ),
              )
            : null,
        title: Text(
          "Categories",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 25),
        child: Obx(() {
          return homescreenController.categoryList.isEmpty
              ? Text('Data not found')
              : ListView.builder(
                  itemCount: homescreenController.categoryList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, i) => Category(),
                );
        }),
      ),
    );
  }
}
