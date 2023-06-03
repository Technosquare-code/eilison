import 'package:elison/Components/Comments.dart';
import 'package:elison/Components/InputFeild.dart';
import 'package:elison/Components/Post.dart';
import 'package:elison/Components/shimmer/addressShimmer.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/controllers/customer/posts/post_detail_controller.dart';
import 'package:elison/models/comment_model.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/customer/posts/post_controller.dart';

class PostDetailScreen extends StatefulWidget {
  // final int? index;
  // final String? id;
  // final String? uid;
  // final String? postContent;
  // final String? postMedia;
  // final String? isVideo;
  // final String? isImage;
  // final int? totalLike;
  // final int? totalComment;
  // final String? status;
  // final DateTime? createdDate;
  // final String? userProfile;
  // final String? userName;
  // final bool? isLike;
  PostDetailScreen(
      // {
      // this.createdDate,
      // this.id,
      // this.index,
      // this.isImage,
      // this.isVideo,
      // this.postContent,
      // this.postMedia,
      // this.totalComment,
      // this.status,
      // this.totalLike,
      // this.uid,
      // this.userName,
      // this.userProfile,
      // this.isLike,
      // }
      );
  static const routeName = "PostDetailScreen";

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  bool replying = false;
  final commentFocus = FocusNode();
  final postDetailContrl =
      Get.put(PostDetailController(post_id: Get.arguments[0].id));

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              CupertinoIcons.back,
              color: Colors.black,
              size: 20,
            ),
          ),
          title: Text(
            "Post",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 45,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Post(
                isedit: false,
                isLike: Get.arguments[0].isLike,
                createdDate: Get.arguments[0].createdDate,
                id: Get.arguments[0].id,
                isImage: Get.arguments[0].isImage,
                isVideo: Get.arguments[0].isVideo,
                postContent: Get.arguments[0].postContent,
                userName: Get.arguments[0].userName,
                userProfile: Get.arguments[0].userProfile,
                postMedia: Get.arguments[0].postMedia,
                status: Get.arguments[0].status,
                totalComment: Get.arguments[0].totalComment,
                totalLike: Get.arguments[0].totalLike,
                uid: Get.arguments[0].uid,
                isMain: false,
              ),
              Container(
                color: Colors.white,
                width: size.width,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(16, 15, 16, 15),
                child: Text(
                  "Comments (${postDetailContrl.commentList.length})",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              postDetailContrl.isLoading.value
                  ? shimmerCard(context)
                  : ListView.builder(
                      itemCount: postDetailContrl.groupCommentList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, i) =>
                          buildCommentItem(postDetailContrl.groupCommentList[i])
                      // Column(
                      //   children: [
                      //     Comments(
                      //       commentId:
                      //           postDetailContrl.commentList[i].commentId,
                      //       commentText:
                      //           postDetailContrl.commentList[i].comment,
                      //       createdDate:
                      //           postDetailContrl.commentList[i].createdDate,
                      //       id: postDetailContrl.commentList[i].id,
                      //       name: postDetailContrl.commentList[i].name,
                      //       profilePicture:
                      //           postDetailContrl.commentList[i].profilePicture,
                      //       comment: () {
                      //         replying = true;
                      //         setState(() {});
                      //         commentFocus.requestFocus();
                      //       },
                      //     ),
                      //   ],
                      // ),
                      ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        bottomSheet: Container(
          color: Colors.white,
          width: size.width,
          padding: EdgeInsets.fromLTRB(
            5,
            5,
            5,
            MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (replying)
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 5, 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "# Reply to ${postDetailContrl.replyingTo.value != null ? postDetailContrl.replyingTo.value!.name : ''}",
                        style: TextStyle(
                          fontSize: 12,
                          color: primaryColor,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          replying = false;
                          setState(() {});
                          if (commentFocus.hasFocus) {
                            commentFocus.unfocus();
                          }
                        },
                        icon: Icon(
                          Icons.cancel_outlined,
                          color: primaryColor,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      controller: postDetailContrl.commentController,
                      size: 25,
                      borderRadius: 2,
                      hint: "Add a comment",
                      focusNode: commentFocus,
                      color: Colors.grey.shade100,
                    ),
                  ),
                  const SizedBox(width: 15),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => CommentScreen(),
                      //     ));
                      if (postDetailContrl.commentController.text.isNotEmpty) {
                        postDetailContrl.addComment(
                            context,
                            Get.arguments[0].id,
                            replying
                                ? postDetailContrl.replyingTo.value!.commentId
                                : '',
                            postDetailContrl.commentController.text);
                      }
                      print('000000000000000000000000000$replying');
                      replying = false;
                      setState(() {});
                      if (commentFocus.hasFocus) {
                        commentFocus.unfocus();
                      }
                    },
                    child: Text(
                      "SEND",
                      style: TextStyle(
                        fontSize: 12,
                        color: primaryColor,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  String formatDateTime(String dateTime) {
    DateTime parsedDateTime = DateTime.parse(dateTime);
    return "${parsedDateTime.day.toString().padLeft(2, '0')}-${parsedDateTime.month.toString().padLeft(2, '0')}-${parsedDateTime.year.toString()} ${parsedDateTime.hour}:${parsedDateTime.minute.toString().padLeft(2, '0')} ${parsedDateTime.hour > 12 ? 'pm' : 'am'}";
  }

  Widget buildCommentItem(CommentModel comment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Comments(
          commentId: comment.commentId,
          commentText: comment.comment,
          createdDate: comment.createdDate,
          id: comment.id,
          name: comment.name,
          profilePicture: comment.profilePicture,
          comment: () {
            replying = true;
            setState(() {});
            commentFocus.requestFocus();
            print(comment.name);
            print('object-----------');
            postDetailContrl.replyingTo.value = comment;
          },
        ),
        if (comment.replies.isNotEmpty)
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var reply in comment.replies)
                    Comments(
                      commentId: reply.commentId,
                      commentText: reply.comment,
                      createdDate: reply.createdDate,
                      id: reply.id,
                      name: reply.name,
                      profilePicture: reply.profilePicture,
                      comment: () {
                        replying = true;
                        setState(() {});
                        commentFocus.requestFocus();
                        print(reply.name);
                        postDetailContrl.replyingTo.value = reply;
                      },
                    ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

Widget shimmerCard(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) => Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeShimmer(
                  width: 50,
                  height: 50,
                  radius: 15,
                  baseColor: Colors.grey.shade500,
                  highlightColor: Colors.grey.shade300,
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeShimmer(
                        width: double.infinity,
                        height: 12,
                        radius: 15,
                        baseColor: Colors.grey.shade500,
                        highlightColor: Colors.grey.shade300,
                      ),
                      const SizedBox(height: 5),
                      FadeShimmer(
                        width: double.infinity,
                        height: 10,
                        radius: 15,
                        baseColor: Colors.grey.shade500,
                        highlightColor: Colors.grey.shade300,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Container(
              width: double.infinity,
              height: 10,
              color: Colors.white,
            ),
          ],
        ),
      ),
    ),
    itemCount: 4,
  );
}
