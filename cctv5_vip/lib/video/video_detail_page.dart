import 'package:cctv5_vip/home/model/video.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vip5_video_player/vip5_video_player.dart';
import 'package:vip5_video_player/vip5_video_player_controller.dart';
import 'package:vip5_video_player/vip5_video_player_type.dart';

class VideoDetailPage extends StatefulWidget {
  final Video video;
  VideoDetailPage({Key key, this.video}) : super(key: key);
  @override
  _VideoDetailPageState createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  Vip5VideoPlayer _player;
  Vip5VideoPlayerController _playerController;
  _load(int state) {
    if (state == CNPlayerLoadState.Playable) {
      //加载完成自动播放
      _playerController.start();
    }
  }

  _playback(int state) {}
  _vdnRequest(int state) {}
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _playerController = Vip5VideoPlayerController(params: {
      'videoUrl': widget.video.guid,
      'title': widget.video.title,
    }, load: _load, playback: _playback, vdnRequest: _vdnRequest);
    _player = Vip5VideoPlayer(
      playerController: _playerController,
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
                            _playerController.start();
                          },
                          child: Text('开始'),
                        ),
                        InkWell(
                          onTap: () {
                            _playerController.pause();
                          },
                          child: Text('暂停'),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text('停止'),
                        ),
                        InkWell(
                          onTap: () {
                            // _playerController.dispose();
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
    _playerController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
