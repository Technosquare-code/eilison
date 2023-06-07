import 'package:elison/apiServices/profile_tab_service.dart';
import 'package:elison/controllers/customer/posts/post_controller.dart';
import 'package:elison/models/comment_model.dart';
import 'package:elison/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class PostDetailController extends GetxController {
  String? post_id;
  PostDetailController({this.post_id});
  // var postList = List<PostListModel>.empty(growable: true).obs;
  // var mypostList = List<PostListModel>.empty(growable: true).obs;
  var commentList = List<CommentModel>.empty(growable: true).obs;
  // var groupCommentList = List<CommentModel>.empty(growable: true).obs;
  var replyingTo = Rxn<CommentModel>();
  var commentCount = 0.obs;
  final commentController = TextEditingController();
  var isLoading = false.obs;
  final postController = Get.find<PostController>();

  String capitalize(String input) {
    if (input.length > 1) {
      return input.substring(0, 1).toUpperCase() +
          input.substring(1).toLowerCase();
    } else {
      return input.toUpperCase();
    }
  }

  String formatName(String fullName) {
    List<String> nameParts = fullName.split(" ");
    List<String> formattedParts =
        nameParts.map((part) => capitalize(part)).toList();

    return formattedParts.join(" ");
  }

  int calculateTotalComments(List<dynamic> comments) {
    int totalComments = comments.length;

    for (CommentModel comment in comments) {
      if (comment.reply != null) {
        totalComments += comment.reply!.length;
      }
    }

    return totalComments;
  }

  getComments(String post_id) async {
    isLoading(true);
    commentList.assignAll(await ProfileTabService().commentList(post_id));
    print(commentList);
  }

  // List<CommentModel> groupComments(List<CommentModel> commentList) {
  //   Map<String, CommentModel> commentMap = {};

  //   for (CommentModel comment in commentList) {
  //     if (!commentMap.containsKey(comment.commentId)) {
  //       commentMap[comment.commentId] = comment;
  //     } else {
  //       CommentModel existingComment = commentMap[comment.commentId]!;
  //       existingComment.replies.add(comment);
  //     }
  //   }

  //   List<CommentModel> filteredComments = commentMap.values.toList();

  //   // return filteredComments;
  //   print('===================${filteredComments.length}');
  //   return filteredComments;
  // }

  // List<CommentModel> groupComments(List<CommentModel> comments) {
  //   List<CommentModel> mainComments = [];
  //   List<CommentModel> replies = [];

  //   for (var comment in comments) {
  //     if (comment.commentId == "0") {
  //       mainComments.add(comment);
  //     } else {
  //       replies.add(comment);
  //     }
  //   }

  //   for (var mainComment in mainComments) {
  //     mainComment.replies =
  //         replies.where((reply) => reply.commentId == mainComment.id).toList();
  //   }

  //   return mainComments;
  // }

  addComment(BuildContext context, String post_id, comment_id, comment) async {
    bool check = await ProfileTabService().postComment(context,
        comment: comment, comment_id: comment_id, post_id: post_id);
    if (check) {
      await getComments(post_id);

      commentController.clear();
      commentCount.value = await calculateTotalComments(commentList.value);
      isLoading(false);
      // groupCommentList.value = groupComments(commentList.value);

      postController.getallPost();
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
    commentCount.value = await calculateTotalComments(commentList.value);
    // groupCommentList.value = groupComments(commentList.value);
    isLoading(false);
    print('init pe at ------------------------------');
    super.onInit();
  }
}
