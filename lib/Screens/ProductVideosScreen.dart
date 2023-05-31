import 'package:elison/Components/ProductVideos.dart';
import 'package:elison/Components/shimmer/OurVideosShimmer.dart';
import 'package:elison/Components/shimmer/addressShimmer.dart';
import 'package:elison/package%20edit/responsive_grid_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../controllers/customer/video_controller.dart';

class ProductVideoScreen extends StatelessWidget {
  final videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() {
      print('sssssssssssss${videoController.videoList.length}');
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            "Our Videos",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: videoController.isLoading.value
            ? OurVideosShimmer()
            : videoController.videoList.isEmpty
                ? Text('No data found')
                : SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 25),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: videoController.videoList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, i) => GestureDetector(
                        onTap: () {
                          if (videoController.videoList[i].videoUrl != "") {
                            Get.toNamed(
                              "/video-player-screen",
                              arguments: videoController.videoList[i].videoUrl,
                            );
                          }
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => VideoScreen(
                          //           videoUrl:
                          //               videoController.videoList[i].videoUrl),
                          //     ));
                        },
                        child: ProductVideos(
                            videoController.videoList[i].youtubeVideoThumbnail,
                            videoController.videoList[i].videoTitle),
                      ),
                    ),
                  ),
      );
    });
  }
}

class VideoScreen extends StatefulWidget {
  final String? videoUrl;

  VideoScreen({Key? key, @required this.videoUrl}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl!)!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: YoutubePlayer(
          controller: _controller!,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
        ),
      ),
    );
  }

  // Future<bool> _onBackPressed() async {
  //   await _controller!.pause();
  //   await _controller.setPlaybackRate(0);
  //   await _controller.removeListener();
  //   await _controller.dispose();
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ]);
  //   return true;
  // }
  @override
  void dispose() {
    _controller!.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      // DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}
