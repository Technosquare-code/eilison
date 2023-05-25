import 'dart:io';

import 'package:elison/apiServices/profile_tab_service.dart';
import 'package:elison/controllers/customer/posts/post_controller.dart';
import 'package:elison/models/post_model.dart';
import 'package:elison/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:video_player/video_player.dart';

class AddEditPostController extends GetxController {
  bool? isEdit;
  int? index;
  AddEditPostController({this.isEdit, this.index});
  var postList = List<PostListModel>.empty(growable: true).obs;
  var imageUploded = ''.obs;
  var isVideo = false.obs;
  var videoPlayerController = Rxn<VideoPlayerController>();
  var initializeVideoPlayerFuture = Rxn<Future<void>>();
  final descriptionController = TextEditingController();
  var isLoading = false.obs;
  final postController = Get.find<PostController>();
  addpost(File? img, BuildContext context, bool isImg) async {
    isLoading(true);
    print(img);
    bool check = await ProfileTabService().addPostApi(context,
        image: img,
        isImg: isImg,
        description: descriptionController.text,
        post_id: isEdit! ? postController.postList[index!].id : '');
    if (check) {
      // get posts
      await postController.getPosts();
    }
    isLoading(false);
    postController.isLoading(false);
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    // await getPosts();
    isLoading(true);
    print('object--------------$isEdit');

    if (isEdit!) {
      print('object--------------$isEdit');
      descriptionController.text = postController.postList[index!].postContent;
      imageUploded.value = postController.postList[index!].postMedia;
      isVideo.value =
          postController.postList[index!].isVideo == '0' ? false : true;
      if (isVideo.value) {
        videoPlayerController.value = VideoPlayerController.network(
            mainUrl + postUrl + postController.postList[index!].postMedia);
        initializeVideoPlayerFuture.value =
            videoPlayerController.value!.initialize();
      }
    }
    isLoading(false);
    super.onInit();
  }
}
