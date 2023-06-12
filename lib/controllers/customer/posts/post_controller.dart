import 'package:elison/apiServices/profile_tab_service.dart';
import 'package:elison/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  var postList = List<PostListModel>.empty(growable: true).obs;
  var isAllPostLoading = true.obs;

  var mypostList = List<PostListModel>.empty(growable: true).obs;
  var isMyPostLoading = true.obs;

  final descriptionController = TextEditingController();
  var isLoading = false.obs;
  var isDeleting = false.obs;
  getPosts() async {
    isLoading(true);
    postList.assignAll(await ProfileTabService().postsList());
    mypostList.assignAll(await ProfileTabService().mypostsList());
  }

  getallPost() async {
    isAllPostLoading(true);
    postList.assignAll(await ProfileTabService().postsList());
    isAllPostLoading(false);
  }

  getmyPost() async {
    isMyPostLoading(true);
    mypostList.assignAll(await ProfileTabService().mypostsList());
    isMyPostLoading(false);
  }

  managelike(BuildContext context, String postid) async {
    await ProfileTabService().postLike(context, post_id: postid);
  }

  deletePost(BuildContext context, String postId) async {
    isDeleting(true);
    bool check =
        await ProfileTabService().deletePostApi(context, postId: postId);
    if (check) {
      mypostList.removeWhere((element) => element.id == postId);
      postList.removeWhere((element) => element.id == postId);
      mypostList.refresh();
      postList.refresh();
    }
    isDeleting(false);
  }

  @override
  void onInit() async {
    await getallPost();
    super.onInit();
  }
}
