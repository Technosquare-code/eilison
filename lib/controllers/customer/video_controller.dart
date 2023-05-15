import 'package:elison/apiServices/home_screen_service.dart';
import 'package:elison/models/video_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'mainscreen_controller.dart';

class VideoController extends GetxController {
  var videoList = List<VideoModel>.empty(growable: true).obs;
  var isLoading = false.obs;
  getVideos() async {
    isLoading(true);
    videoList.assignAll(await HomeScreenService().videoListApi());
    isLoading(false);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getVideos();
    super.onInit();
  }
}
