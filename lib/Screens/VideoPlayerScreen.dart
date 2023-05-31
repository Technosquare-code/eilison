import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;
  late String video;
  bool getInfo = false;

  @override
  void didChangeDependencies() {
    if (getInfo == false) {
      video = ModalRoute.of(context)!.settings.arguments.toString();
      var videoId = YoutubePlayer.convertUrlToId(video).toString();
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          disableDragSeek: true,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: false,
          hideControls: false,
          hideThumbnail: false,
        ),
      );
      getInfo = true;
      setState(() {});
    }
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    _controller.pause();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _controller.value.isFullScreen
          ? null
          : AppBar(
              backgroundColor: Colors.black,
            ),
      body: Center(
        child: YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: _controller,
              aspectRatio: (size.width) / (size.height / 4),
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
            ),
            builder: (context, player) {
              return player;
            }),
      ),
    );
  }
}
