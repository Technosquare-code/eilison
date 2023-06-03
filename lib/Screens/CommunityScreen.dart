import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Components/Post.dart';
import 'package:elison/Components/shimmer/ComunityShimmer.dart';
import 'package:elison/Components/shimmer/addressShimmer.dart';
import 'package:elison/Screens/AddPostScreen.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/Utils/Utils.dart';
import 'package:elison/controllers/customer/posts/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Components/AddPostSheet.dart';
import '../controllers/customer/posts/add_edit_post_controller.dart';

class CommunityScreen extends StatefulWidget {
  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final postController = Get.put(PostController());
  int selectedIndex = 0;

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
                    ? Container(
                        height: size.height - size.height * 0.2,
                        width: size.width,
                        color: Colors.white,
                        child: Center(
                          child: Text("No data found"),
                        ),
                      )
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
                                    return Post(
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
