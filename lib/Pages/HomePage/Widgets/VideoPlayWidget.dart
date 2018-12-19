import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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
    _controller = VideoPlayerController.network(
      'http://lf1-ttcdn-tos.pstatp.com/obj/mosaic-legacy/30a8001378b9049f5f73',
    )
      ..addListener(() {
        final bool isPlaying = _controller.value.isPlaying;
        if (isPlaying != _isPlaying) {
          setState(() {
            _isPlaying = isPlaying;
          });
        }
      })
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: Stack(
            children: <Widget>[
              _controller.value.initialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
              Center(
                child: Offstage(
                  offstage:  false,
                  child: IconButton(
                    iconSize: 50,
                    icon: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow,),
                    onPressed: _controller.value.isPlaying
                        ? _controller.pause
                        : _controller.play,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
