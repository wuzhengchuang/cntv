import 'package:cctv5_vip/home/model/video.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vip5_video_player/vip5_video_player.dart';

class VideoDetailPage extends StatefulWidget {
  final Video video;
  VideoDetailPage({Key key, this.video}) : super(key: key);
  @override
  _VideoDetailPageState createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  Vip5VideoPlayer _player;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player = Vip5VideoPlayer(
      params: {
        'videoUrl': widget.video.guid,
        'title': widget.video.title,
      },
    );
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: _player,
                  ),
                  Positioned(
                    bottom: 30,
                    left: 0,
                    right: 0,
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            _player.start();
                          },
                          child: Text('开始'),
                        ),
                        InkWell(
                          onTap: () {
                            _player.pause();
                          },
                          child: Text('暂停'),
                        ),
                        InkWell(
                          onTap: () {
                            _player.stop();
                          },
                          child: Text('停止'),
                        ),
                        InkWell(
                          onTap: () {
                            _player.stop();
                            SystemChrome.setPreferredOrientations([
                              DeviceOrientation.portraitUp,
                              DeviceOrientation.portraitDown
                            ]);
                            Navigator.of(context).pop();
                          },
                          child: Text('返回页面'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        onWillPop: () {
          print('onWillPop');

          return null;
        });
  }

  @override
  void dispose() {
    print('VideoDetailPage销毁了');
    // TODO: implement dispose
    super.dispose();
  }
}
