import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Components/Post.dart';
import 'package:elison/Components/shimmer/ComunityShimmer.dart';
import 'package:elison/Components/shimmer/addressShimmer.dart';
import 'package:elison/Screens/AddPostScreen.dart';
import 'package:elison/Screens/NoDataFoundScreen.dart';
import 'package:elison/Screens/PostDetailScreen.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/Utils/Utils.dart';
import 'package:elison/controllers/customer/posts/post_controller.dart';
import 'package:elison/models/comment_model.dart';
import 'package:elison/models/post_model.dart';
import 'package:elison/urls.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Components/AddPostSheet.dart';
import '../Components/Comments.dart';
import '../Components/InputFeild.dart';
import '../Components/postOptions.dart';
import '../Components/video_player.dart';
import '../controllers/customer/posts/add_edit_post_controller.dart';
import '../controllers/customer/posts/post_detail_controller.dart';

class CommunityScreen extends StatefulWidget {
  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final postController = Get.put(PostController());
  int selectedIndex = 0;
  void updatePostLikedStatus(int index, bool liked) {
    setState(() {
      postController.postList[index].isLike = liked;
      // postController.postList[index].totalComment = likedCount;
      if (liked) {
        postController.postList[index].totalLike++;
      } else {
        postController.postList[index].totalLike--;
      }
      print(
          'parent page==============${postController.postList[index].isLike}, ${postController.postList[index].totalLike}');
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Eilison Community",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Obx(() {
        return RefreshIndicator(
          onRefresh: () async {
            await postController.getPosts();
            postController.isLoading(false);
          },
          child: SingleChildScrollView(
            child: postController.isLoading.value
                ? CommunityShimmer()
                : postController.postList.isEmpty
                    ? NopostFound(size: size)
                    : Column(
                        children: [
                          Container(
                            color: Colors.white,
                            padding: const EdgeInsets.fromLTRB(8, 5, 10, 5),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    selectedIndex = 0;
                                    setState(() {});
                                    print(selectedIndex);
                                    print('alll post');
                                    // postController.getallPost();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: selectedIndex == 0
                                          ? primaryColor
                                          : Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      "All Post",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: selectedIndex == 0
                                            ? Colors.white
                                            : Colors.black,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                InkWell(
                                  onTap: () {
                                    selectedIndex = 1;
                                    setState(() {});
                                    print(selectedIndex);
                                    // postController.getmyPost();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: selectedIndex == 1
                                          ? primaryColor
                                          : Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      "My Post",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: selectedIndex == 1
                                            ? Colors.white
                                            : Colors.black,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          selectedIndex == 0
                              ? ListView.builder(
                                  itemCount: postController.postList.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (ctx, i) {
                                    final post = postController.postList[i];
                                    return InkWell(
                                      onTap: () async {
                                        print('object');
                                        bool? updatedLikedStatus =
                                            await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      PostDetailScreen(
                                                          postListModel: post,
                                                          onUpdate: (liked,
                                                              likeCount) {
                                                            updatePostLikedStatus(
                                                              i,
                                                              liked,
                                                            );
                                                            post.totalComment =
                                                                likeCount;
                                                          },
                                                          onDeleteController:
                                                              () {
                                                            // Delete the postController here
                                                            Get.delete<
                                                                PostDetailController>();
                                                          }),
                                                ));
                                        if (updatedLikedStatus != null) {
                                          updatePostLikedStatus(
                                            i,
                                            updatedLikedStatus,
                                          );
                                        }
                                        //                                Get.toNamed('/post-detail', arguments: [
                                        //   PostListModel(
                                        //       id: widget.id!,
                                        //       uid: widget.uid!,
                                        //       postContent: widget.postContent!,
                                        //       userName: widget.userName!,
                                        //       userProfile: widget.userProfile!,
                                        //       postMedia: widget.postMedia!,
                                        //       isVideo: widget.isVideo!,
                                        //       isImage: widget.isImage!,
                                        //       totalLike: widget.totalLike!,
                                        //       totalComment: widget.totalComment!,
                                        //       status: widget.status!,
                                        //       createdDate: widget.createdDate!,
                                        //       isLike: widget.isLike!)
                                        // ]);
                                      },
                                      child: Post(
                                        post: post,
                                        isLike: post.isLike,
                                        isedit: false,
                                        userName: post.userName,
                                        userProfile: post.userProfile,
                                        index: i,
                                        createdDate: post.createdDate,
                                        id: post.id,
                                        isImage: post.isImage,
                                        isVideo: post.isVideo,
                                        postContent: post.postContent,
                                        // postHashtags:
                                        //     post.postHashtags,
                                        postMedia: post.postMedia,
                                        status: post.status,
                                        totalComment: post.totalComment,
                                        totalLike: post.totalLike,
                                        uid: post.uid,
                                      ),
                                    );
                                  })
                              : postController.mypostList.isEmpty
                                  ? Container(
                                      height: size.height - size.height * 0.2,
                                      width: size.width,
                                      color: Colors.white,
                                      child: Center(
                                        child: Text("No data found"),
                                      ),
                                    )
                                  : ListView.builder(
                                      itemCount:
                                          postController.mypostList.length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (ctx, i) {
                                        final post =
                                            postController.mypostList[i];

                                        return Post(
                                          post: post,
                                          isLike: post.isLike,
                                          isedit: true,
                                          userName: post.userName,
                                          userProfile: post.userProfile,
                                          index: i,
                                          createdDate: post.createdDate,
                                          id: post.id,
                                          isImage: post.isImage,
                                          isVideo: post.isVideo,
                                          postContent: post.postContent,
                                          // postHashtags:
                                          //     postController.mypostList[i].postHashtags,
                                          postMedia: post.postMedia,
                                          status: post.status,
                                          totalComment: post.totalComment,
                                          totalLike: post.totalLike,
                                          uid: post.uid,
                                        );
                                      }),
                        ],
                      ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn2",
        onPressed: () {
          // Get.toNamed('/add-post', arguments: [false, 0]);
          // Utils.showMyBottomSheet(context, AddPostSheet(0, false));
          Utils.showMyBottomSheet(
              context,
              AddPostSheet(0, false, onDeleteController: () {
                // Delete the postController here
                Get.delete<AddEditPostController>();
              }));
          // Navigator.of(context).pushNamed(AddPostScreen.routeName);
        },
        elevation: 8,
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: primaryColor,
          size: 30,
        ),
      ),
    );
  }
}

class NopostFound extends StatelessWidget {
  const NopostFound({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height - size.height * 0.24,
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/nopost.png',
              // width: size.width * 0.3,
              // height: size.width * 0.3,
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              'No data found',
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: size.height * 0.13),
          ],
        ),
      ),
    );
  }
}

class Post extends StatefulWidget {
  final PostListModel post;
  final bool isedit;
  final int? index;
  final String? id;
  final String? uid;
  final String? postContent;
  final String? postMedia;
  final String? isVideo;
  final String? isImage;
  final int? totalLike;
  final int? totalComment;
  final String? status;
  final DateTime? createdDate;
  final String? userProfile;
  final String? userName;
  final bool? isLike;
  final bool? isMain;
  const Post({
    this.createdDate,
    this.isedit = false,
    this.id,
    this.isImage,
    this.isVideo,
    this.postContent,
    this.postMedia,
    this.status,
    this.totalComment,
    this.totalLike,
    this.index,
    this.userName,
    this.userProfile,
    this.uid,
    this.isLike,
    required this.post,
    this.isMain = true,
  });
  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  // bool liked = false;
  // int like = 116;
  final postController = Get.find<PostController>();

  timeDiff(DateTime comingDateTime) {
    // Current datetime
    DateTime currentDateTime = DateTime.now();

    // Another datetime (e.g., coming date)
    // DateTime comingDateTime = DateTime(2023, 5, 20, 12, 0, 0);

    // Calculate the difference
    Duration difference = currentDateTime.difference(comingDateTime);

    // Extract the difference in days, hours, and minutes
    int days = difference.inDays;
    int hours = difference.inHours;
    int minutes = difference.inMinutes;
    // print('object $difference');
    String differenceString;

    if (days > 0) {
      differenceString = '$days day ago';
    } else if (hours > 0) {
      differenceString = '$hours hr ago';
    } else if (minutes > 0) {
      differenceString = '$minutes min ago';
    } else {
      differenceString = 'Less than a minute';
    }

    // print('Difference: $differenceString');
    return differenceString;
  }

  void _toggleLike() {
    setState(() {
      if (widget.post.isLike) {
        widget.post.isLike = false;
        // widget.post.totalLike--;
      } else {
        widget.post.isLike = true;
        // widget.post.totalLike++;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    // liked = widget.isLike!;
    // print('is liked ka init h $liked');
    // like = widget.totalLike!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey.shade300,
      margin: const EdgeInsets.only(bottom: 5),
      child: Container(
        padding: const EdgeInsets.only(bottom: 5),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              horizontalTitleGap: 8,
              leading: (widget.userProfile == '' || widget.userProfile == null)
                  ? CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey.shade100,
                      backgroundImage: AssetImage("assets/images/avatar.png"),
                    )
                  : CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey.shade100,
                      backgroundImage: NetworkImage(
                          mainUrl + imageUrl + widget.userProfile!),
                    ),
              title: Text(
                widget.userName ?? "Manoj Saini",
                // .toString(),
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                // "2 days ago",
                timeDiff(widget.createdDate ?? DateTime.now()),
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: widget.isedit
                  ? IconButton(
                      onPressed: () {
                        Utils.showMyBottomSheet(
                            context, postoptions(widget.id!, widget.index!));
                      },
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.black,
                        size: 25,
                      ),
                    )
                  : SizedBox(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                // "Has updated a new picture..",
                widget.postContent! ?? "Has updated a new picture..",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 5),
            widget.isVideo == '0'
                ? Image.network(
                    // 'assets/images/post.jpg',
                    mainUrl + postUrl + widget.postMedia!,
                    width: size.width,
                    height: size.height / 2.5,
                    fit: BoxFit.cover,
                  )
                : VideoPlayerItem(
                    videoUrl: mainUrl + postUrl + widget.postMedia!),
            widget.isMain!
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // liked = !liked;
                            // if (liked == true) {
                            //   like++;
                            // } else {
                            //   like--;
                            // }
                            // setState(() {});
                            _toggleLike();
                            final _CommunityScreenState? listViewScreenState =
                                context.findAncestorStateOfType<
                                    _CommunityScreenState>();
                            if (listViewScreenState != null) {
                              final postIndex = listViewScreenState
                                  .postController.postList
                                  .indexOf(widget.post);
                              // final postIndex = listViewScreenState.posts.indexOf(post);
                              listViewScreenState.updatePostLikedStatus(
                                postIndex,
                                widget.post.isLike,
                              );
                            }
                            setState(() {});
                            postController.managelike(context, widget.id!);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                widget.post.isLike
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: widget.post.isLike
                                    ? primaryColor
                                    : Colors.black,
                                size: 15,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "${widget.post.totalLike}",
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 30),
                        Icon(
                          Icons.comment,
                          color: Colors.black,
                          size: 15,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "${widget.totalComment}",
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

//
class PostDetailScreen extends StatefulWidget {
  final PostListModel? postListModel;
  final Function(bool, int) onUpdate;
  Function onDeleteController;
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
      {this.postListModel,
      required this.onDeleteController,
      required this.onUpdate
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
      });
  static const routeName = "PostDetailScreen";

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  bool replying = false;
  final commentFocus = FocusNode();
  final postController = Get.find<PostController>();
  // final postDetailContrl =
  //     Get.put(PostDetailController(post_id: Get.arguments[0].id));
  late PostDetailController postDetailContrl;
  bool liked = false;
  int like = 0;
  @override
  void initState() {
    super.initState();
    liked = widget.postListModel!.isLike;
    like = widget.postListModel!.totalLike;
    print('0000000000000000 $liked');
    postDetailContrl = Get.put(
      PostDetailController(post_id: widget.postListModel!.id),
    );
  }

  void _toggleLike() {
    setState(() {
      if (liked) {
        liked = false;
        like--;
      } else {
        liked = true;
        like++;
      }
    });
  }

  @override
  void dispose() {
    postDetailContrl.dispose();
    widget.onDeleteController(); // Invoke the callback function
    super.dispose();
  }

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
                post: widget.postListModel!,
                isedit: false,
                isLike: liked,
                createdDate: widget.postListModel!.createdDate,
                id: widget.postListModel!.id,
                isImage: widget.postListModel!.isImage,
                isVideo: widget.postListModel!.isVideo,
                postContent: widget.postListModel!.postContent,
                userName: widget.postListModel!.userName,
                userProfile: widget.postListModel!.userProfile,
                postMedia: widget.postListModel!.postMedia,
                status: widget.postListModel!.status,
                totalComment: widget.postListModel!.totalComment,
                totalLike: widget.postListModel!.totalLike,
                uid: widget.postListModel!.uid,
                isMain: false,
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          // liked = !liked;
                          // if (liked == true) {
                          //   like++;
                          // } else {
                          //   like--;
                          // }
                          // setState(() {});
                          _toggleLike();
                          // final _CommunityScreenState? listViewScreenState =
                          //     context.findAncestorStateOfType<
                          //         _CommunityScreenState>();
                          // if (listViewScreenState != null) {
                          //   final postIndex = listViewScreenState
                          //       .postController.postList
                          //       .indexOf(widget.postListModel);
                          //   // final postIndex = listViewScreenState.posts.indexOf(post);
                          //   listViewScreenState.updatePostLikedStatus(
                          //       postIndex, widget.postListModel!.isLike);
                          // }
                          widget.onUpdate(liked, like);
                          setState(() {});
                          postController.managelike(
                              context, widget.postListModel!.id);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              liked ? Icons.favorite : Icons.favorite_border,
                              color: liked ? primaryColor : Colors.black,
                              size: 15,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "${like}",
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(() {
                return Container(
                  color: Colors.white,
                  width: size.width,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(16, 15, 16, 15),
                  child: Text(
                    "Comments (${postDetailContrl.commentCount.value})",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              }),
              postDetailContrl.isLoading.value
                  ? shimmerCard(context)
                  : ListView.builder(
                      itemCount: postDetailContrl.commentList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, i) =>
                          buildCommentItem(postDetailContrl.commentList[i])
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
                            widget.postListModel!.id,
                            replying
                                ? postDetailContrl.replyingTo.value!.id
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
        if (comment.reply != null)
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var reply in comment.reply!)
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
