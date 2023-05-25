import 'package:elison/apiServices/profile_tab_service.dart';
import 'package:elison/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class PostController extends GetxController {
  var postList = List<PostListModel>.empty(growable: true).obs;
  var mypostList = List<PostListModel>.empty(growable: true).obs;

  final descriptionController = TextEditingController();
  var isLoading = false.obs;
  getPosts() async {
    isLoading(true);
    postList.assignAll(await ProfileTabService().postsList());
    mypostList.assignAll(await ProfileTabService().mypostsList());
  }

  getallPost() async {
    isLoading(true);
    postList.assignAll(await ProfileTabService().postsList());
    isLoading(false);
  }

  getmyPost() async {
    isLoading(true);
    mypostList.assignAll(await ProfileTabService().mypostsList());
    isLoading(false);
  }

  managelike(BuildContext context, String postid) async {
    await ProfileTabService().postLike(context, post_id: postid);
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
