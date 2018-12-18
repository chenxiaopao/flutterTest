import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class VideoPlayWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return  VideoPlayWidgetState();
  }
}

class VideoPlayWidgetState extends State<VideoPlayWidget>{
  VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'http://www.365yg.com/a6456194233832309262/#mid=1576158551899150',
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
        Container(width: MediaQuery.of(context).size.width,height: 200,color: Colors.blue,child: ,),
        SizedBox(height: 10,)
      ],
    );
  }

}