import 'package:elison/Components/Comments.dart';
import 'package:elison/Components/InputFeild.dart';
import 'package:elison/Components/Post.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostDetailScreen extends StatefulWidget {
  final int? index;
  final String? id;
  final String? uid;
  final String? postContent;

  final String? postMedia;
  final String? isVideo;
  final String? isImage;
  final String? totalLike;
  final String? totalComment;
  final String? status;
  final DateTime? createdDate;
  final String? userProfile;
  final String? userName;
  PostDetailScreen({
    this.createdDate,
    this.id,
    this.index,
    this.isImage,
    this.isVideo,
    this.postContent,
    this.postMedia,
    this.totalComment,
    this.status,
    this.totalLike,
    this.uid,
    this.userName,
    this.userProfile,
  });
  static const routeName = "PostDetailScreen";

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  bool replying = false;
  final commentFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
              createdDate: widget.createdDate,
              id: widget.id,
              index: widget.index,
              isImage: widget.isImage,
              isVideo: widget.isVideo,
              postContent: widget.postContent,
              userName: widget.userName,
              userProfile: widget.userProfile,
              postMedia: widget.postMedia,
              status: widget.status,
              totalComment: widget.totalComment,
              totalLike: widget.totalLike,
              uid: widget.uid,
            ),
            Container(
              color: Colors.white,
              width: size.width,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(16, 15, 16, 15),
              child: Text(
                "Comments (5)",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, i) => Comments(
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
                    size: 25,
                    borderRadius: 2,
                    hint: "Add a comment",
                    focusNode: commentFocus,
                    color: Colors.grey.shade100,
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  "SEND",
                  style: TextStyle(
                    fontSize: 12,
                    color: primaryColor,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
