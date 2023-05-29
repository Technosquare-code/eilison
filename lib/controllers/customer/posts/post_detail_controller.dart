import 'package:elison/apiServices/profile_tab_service.dart';
import 'package:elison/models/comment_model.dart';
import 'package:elison/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class PostDetailController extends GetxController {
  String? post_id;
  PostDetailController({this.post_id});
  var postList = List<PostListModel>.empty(growable: true).obs;
  var mypostList = List<PostListModel>.empty(growable: true).obs;
  var commentList = List<CommentModel>.empty(growable: true).obs;

  final commentController = TextEditingController();
  var isLoading = false.obs;
  // getPosts() async {
  //   isLoading(true);
  //   postList.assignAll(await ProfileTabService().postsList());
  //   mypostList.assignAll(await ProfileTabService().mypostsList());
  // }

  getComments(String post_id) async {
    isLoading(true);
    commentList.assignAll(await ProfileTabService().commentList(post_id));
    print(commentList);
  }

  // getallPost() async {
  //   isLoading(true);
  //   postList.assignAll(await ProfileTabService().postsList());
  //   isLoading(false);
  // }

  // getmyPost() async {
  //   isLoading(true);
  //   mypostList.assignAll(await ProfileTabService().mypostsList());
  //   isLoading(false);
  // }

  addComment(BuildContext context, String post_id, comment_id, comment) async {
    bool check = await ProfileTabService().postComment(context,
        comment: comment, comment_id: comment_id, post_id: post_id);
    if (check) {
      getComments(post_id);
      isLoading(false);
    }
  }

  // deletePost(BuildContext context, String postId) async {
  //   isLoading(true);
  //   bool check =
  //       await ProfileTabService().deletePostApi(context, postId: postId);
  //   if (check) {
  //     getPosts();
  //   }
  //   isLoading(false);
  // }

  @override
  void onInit() async {
    // TODO: implement onInit
    // await getPosts();
    await getComments(post_id!);
    isLoading(false);
    super.onInit();
  }
}
