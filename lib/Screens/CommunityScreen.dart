import 'package:elison/Components/MyButtton.dart';
import 'package:elison/Components/Post.dart';
import 'package:elison/Components/shimmer/addressShimmer.dart';
import 'package:elison/Screens/AddPostScreen.dart';
import 'package:elison/Utils/Colors.dart';
import 'package:elison/controllers/customer/posts/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        return SingleChildScrollView(
          child: postController.isLoading.value
              ? AddressShimmer(size: size)
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
                                  selectedIndex = 0;
                                  setState(() {});
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
                        ListView.builder(
                          itemCount: postController.postList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (ctx, i) => Post(
                            userName: postController.postList[i].userName,
                            userProfile: postController.postList[i].userProfile,
                            index: i,
                            createdDate: postController.postList[i].createdDate,
                            id: postController.postList[i].id,
                            isImage: postController.postList[i].isImage,
                            isVideo: postController.postList[i].isVideo,
                            postContent: postController.postList[i].postContent,
                            // postHashtags:
                            //     postController.postList[i].postHashtags,
                            postMedia: postController.postList[i].postMedia,
                            status: postController.postList[i].status,
                            totalComment:
                                postController.postList[i].totalComment,
                            totalLike: postController.postList[i].totalLike,
                            uid: postController.postList[i].uid,
                          ),
                        ),
                      ],
                    ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn2",
        onPressed: () {
          Get.toNamed('/add-post', arguments: [false, 0]);
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
