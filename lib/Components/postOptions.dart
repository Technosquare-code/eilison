import 'package:elison/Components/AddPostSheet.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/Utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/customer/posts/add_edit_post_controller.dart';
import '../controllers/customer/posts/post_controller.dart';

class postoptions extends StatefulWidget {
  final String postId;
  final int index;
  postoptions(this.postId, this.index);
  @override
  _postoptionsState createState() => _postoptionsState();
}

class _postoptionsState extends State<postoptions> {
  final postController = Get.find<PostController>();

  String selected = "";
  // final List options = ['Report', 'Edit', 'Delete'];
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return postController.isDeleting.value
          ? Container(
              height: 150,
              child: Center(
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(),
                ),
              ),
            )
          : Column(
              children: [
                const SizedBox(height: 15),
                OptionItem(
                  icon: Icons.report,
                  title: 'Report',
                  selected: selected,
                  onChanged: (s) {
                    selected = s.toString();
                    setState(() {});
                  },
                ),
                OptionItem(
                  title: 'Edit',
                  icon: Icons.edit,
                  selected: selected,
                  onChanged: (s) {
                    selected = s.toString();
                    setState(() {});
                    Navigator.pop(context);
                    // Get.toNamed('/add-post', arguments: [true, widget.index]);
                    Utils.showMyBottomSheet(
                        context,
                        AddPostSheet(widget.index, true,
                            onDeleteController: () {
                          // Delete the postController here
                          Get.delete<AddEditPostController>();
                        }));
                  },
                ),
                OptionItem(
                  icon: Icons.delete,
                  title: 'Delete',
                  selected: selected,
                  onChanged: (s) async {
                    selected = s.toString();

                    await postController.deletePost(context, widget.postId);
                    setState(() {});
                    Navigator.pop(context);
                  },
                ),
                // ListView.builder(
                //   shrinkWrap: true,
                //   itemCount: options.length,
                //   physics: const NeverScrollableScrollPhysics(),
                //   itemBuilder: (ctx, i) =>
                //   OptionItem(
                //     title: options[i],
                //     selected: selected,
                //     onChanged: (s) {
                //       selected = s.toString();
                //       setState(() {});
                //     },
                //   ),
                // ),
              ],
            );
    });
  }
}

class OptionItem extends StatelessWidget {
  final String title;
  final String selected;
  final Function(String?) onChanged;
  final IconData? icon;
  const OptionItem({
    required this.title,
    required this.selected,
    required this.onChanged,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   border: Border(
      //     bottom: BorderSide(color: Colors.grey.shade400, width: 0.6),
      //   ),
      // ),
      child: ListTile(
        style: ListTileStyle.drawer,
        leading: CircleAvatar(
          radius: 18,
          backgroundColor: Colors.grey.withOpacity(0.2),
          child: Icon(
            icon,
            size: 18,
            color: Colors.black,
          ),
        ),
        dense: true,
        onTap: () => onChanged(title),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
