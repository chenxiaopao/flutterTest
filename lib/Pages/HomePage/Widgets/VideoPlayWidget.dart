import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_zhihu_app/Configs/theme.dart';

class VideoPlayWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VideoPlayWidgetState();
  }
}

class VideoPlayWidgetState extends State<VideoPlayWidget> {
  VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/test.mp4',
    )
      ..addListener(() {
        final bool isPlaying = _controller.value.isPlaying;

        if (isPlaying != _isPlaying) {
          if (mounted) {
            setState(() {
              _isPlaying = isPlaying;
            });
          }
        }
      })
      ..initialize().then((_) {
        if (mounted) {
          setState(() {});
        }
      });

    _controller.setLooping(true);
  }

  String calculateTimeStrByDuration(Duration duration) {
    String minuteStr = duration.inMinutes != null
        ? duration.inMinutes < 10
            ? "0${duration.inMinutes}"
            : "${duration.inMinutes}"
        : "00";
    String secondStr = duration.inSeconds != null
        ? duration.inSeconds < 10
            ? "0${duration.inSeconds}"
            : "${duration.inSeconds}"
        : "00";
    return minuteStr + ":" + secondStr;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: _controller.value.initialized
              ? Stack(
                  children: <Widget>[
                    VideoPlayer(_controller),
                    Center(
                      child: Offstage(
                        offstage: false,
                        child: _controller.value.isBuffering
                            ? CircularProgressIndicator()
                            : IconButton(
                                iconSize: 50,
                                icon: Icon(
                                  _controller.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                ),
                                onPressed: _controller.value.isPlaying
                                    ? _controller.pause
                                    : _controller.play,
                              ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: Container(
                        width: 50,
                        height: 20,
                        decoration: ShapeDecoration(
                          color: AppTheme.color4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                        child: Center(
                          child: Text(calculateTimeStrByDuration(
                              _controller.value.duration)),
                        ),
                      ),
                    ),
                  ],
                )
              : Center(child: Text('占位')),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
