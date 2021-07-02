import 'package:cctv5_vip/config/net_config.dart';
import 'package:cctv5_vip/home/model/banner.dart' as HomeBanner;
import 'package:cctv5_vip/home/model/home.dart';
import 'package:cctv5_vip/home/model/home_event.dart';
import 'package:cctv5_vip/home/model/video.dart';
import 'package:cctv5_vip/home/page/banner_widget.dart';
import 'package:cctv5_vip/home/page/event_list_cell.dart';
import 'package:cctv5_vip/home/page/video_cell.dart';
import 'package:cctv5_vip/http/http.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  List _dataArray = [];
  Widget _cellForRow(BuildContext context, int index) {
    Map<String, dynamic> map = _dataArray[index];
    if (map['type'] == 3) {
      //视频
      Video video = Video.fromJson(map);
      return VideoCell(
        video,
        index: index,
      );
    } else if (map['type'] == 1) {
      //轮播图
      HomeBanner.Banner banner = HomeBanner.Banner.fromJson(map);
      return Vip5BannerWidget(
        banner: banner,
      );
    } else if (map['type'] == 2) {
      //赛程
      HomeEvent event = HomeEvent.fromJson(map);
      return EventListCell(
        event,
        index: index,
      );
    }
    return VideoCell(
      null,
      index: index,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Map<String, dynamic> params = {'page': 1};
    Http.instance.get(NetConfig().BASEURL, NetConfig().index_interface,
        success: (data) {
      Home home = Home.fromJson(data);
      if (home.control.status == 200) {
        print('${home.data.index}');
        _dataArray.addAll(home.data.index);
        setState(() {});
      }
    }, error: (String reason, int statusCode) {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: AssetImage('images/assets/black_bg.png'),
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            brightness: Brightness.light,
            centerTitle: true,
            elevation: 0,
            title: Image(
              image: AssetImage('images/assets/cntv_logo.png'),
              width: 53,
            ),
            backgroundColor: Colors.transparent,
          ),
          body: Container(
//            color: Colors.white,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: _cellForRow,
              padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
              itemCount: _dataArray.length,
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
