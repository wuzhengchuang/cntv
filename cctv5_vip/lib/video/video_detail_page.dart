import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vip5_video_player/vip5_video_player.dart';

class VideoDetailPage extends StatefulWidget {
  @override
  _VideoDetailPageState createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  Vip5VideoPlayer _player = Vip5VideoPlayer(
    params: {
      'videoUrl': '82c540483d6e47bca0ab09ac26f05d26',
      'title': '[拳击]人在奥运年——李倩：使命在肩 奋斗有我'
    },
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                    bottom: 0,
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
                            _player.stop();
                          },
                          child: Text('停止'),
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
          SystemChrome.setPreferredOrientations(
              [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
          return Future.value(true);
        });
  }
}
