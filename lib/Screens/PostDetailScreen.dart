import 'package:elison/Components/Comments.dart';
import 'package:elison/Components/InputFeild.dart';
import 'package:elison/Components/Post.dart';
import 'package:elison/Components/shimmer/addressShimmer.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/controllers/customer/posts/post_detail_controller.dart';
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
  final postController = Get.find<PostController>();

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
              fontWeight: FontWeight.w600,
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
                  ? CircularProgressIndicator()
                  : ListView.builder(
                      itemCount: postDetailContrl.commentList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, i) => Comments(
                        commentId: postDetailContrl.commentList[i].commentId,
                        commentText: postDetailContrl.commentList[i].comment,
                        createdDate:
                            postDetailContrl.commentList[i].createdDate,
                        id: postDetailContrl.commentList[i].id,
                        name: postDetailContrl.commentList[i].name,
                        profilePicture:
                            postDetailContrl.commentList[i].profilePicture,
                        comment: () {
                          replying = true;
                          setState(() {});
                          commentFocus.requestFocus();
                        },
                      ),
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
                        "# Reply to Manoj Sainni",
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
                      postDetailContrl.addComment(context, Get.arguments[0].id,
                          '', postDetailContrl.commentController.text);
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
}
