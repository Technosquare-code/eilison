import 'package:elison/apiServices/profile_tab_service.dart';
import 'package:elison/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class PostController extends GetxController {
  var postList = List<PostListModel>.empty(growable: true).obs;

  final descriptionController = TextEditingController();
  var isLoading = false.obs;
  getPosts() async {
    isLoading(true);
    postList.assignAll(await ProfileTabService().postsList());
  }

  deletePost(BuildContext context, String postId) async {
    isLoading(true);
    bool check =
        await ProfileTabService().deletePostApi(context, postId: postId);
    if (check) {
      getPosts();
    }
    isLoading(false);
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    await getPosts();
    isLoading(false);
    super.onInit();
  }
}
