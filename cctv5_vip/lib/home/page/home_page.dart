import 'package:cctv5_vip/base/root_provider.dart';
import 'package:cctv5_vip/config/net_config.dart';
import 'package:cctv5_vip/home/model/banner.dart' as HomeBanner;
import 'package:cctv5_vip/home/model/home.dart';
import 'package:cctv5_vip/home/model/home_event.dart';
import 'package:cctv5_vip/home/model/video.dart';
import 'package:cctv5_vip/home/page/banner_widget.dart';
import 'package:cctv5_vip/home/page/event_list_cell.dart';
import 'package:cctv5_vip/home/page/video_cell.dart';
import 'package:cctv5_vip/home/page/vip5_appbar.dart';
import 'package:cctv5_vip/http/http.dart';
import 'package:cctv5_vip/tools/vip5_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  List _dataArray = [];
  int currentPage = 1;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
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

  _refresh() async {
    Map<String, dynamic> params = {'page': '1'};
    Http.instance.get(NetConfig().BASEURL, NetConfig().index_interface,
        params: params, success: (data) {
      _refreshController.refreshCompleted();
      Home home = Home.fromJson(data);
      if (home.control.status == 200) {
        currentPage = 1;
        _dataArray.clear();
        _dataArray.addAll(home.data.index);
        setState(() {});
      }
    }, error: (String reason, int statusCode) {
      _refreshController.refreshCompleted();
    });
    return null;
  }

  _loading() async {
    Map<String, dynamic> params = {'page': (++currentPage).toString()};
    Http.instance.get(NetConfig().BASEURL, NetConfig().index_interface,
        params: params, success: (data) {
      _refreshController.loadComplete();
      Home home = Home.fromJson(data);
      if (home.control.status == 200) {
        if (currentPage >= home.data.totalPage) {
          _refreshController.loadNoData();
        } else {
          currentPage = currentPage + 1;
        }
        _dataArray.addAll(home.data.index);
        setState(() {});
      }
    }, error: (String reason, int statusCode) {
      _refreshController.loadComplete();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refresh();
  }

  Future<bool> _willPop() {
    Provider.of<RootProvider>(context, listen: false)
        .changeHomeBannerAutoPlay(false);
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Container(
          child: Stack(
            children: [
              Image(
                image: AssetImage('images/assets/black_bg.png'),
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                appBar: Vip5AppBar(
                  // centerTitle: true,
                  // elevation: 0,
                  title: Image(
                    image: AssetImage('images/assets/cntv_logo.png'),
                    width: 53,
                  ),
                  backgroundColor: Colors.transparent,
                ),
                body: Container(
                  child: SmartRefresher(
                    header: CustomHeader(
                      builder: (BuildContext context, RefreshStatus mode) {
                        return Container(
                          height: 60,
                          child: Center(
                            child: Vip5CircleAnimation(),
                          ),
                        );
                      },
                    ),
                    footer: CustomFooter(
                      height: 40,
                      builder: (BuildContext context, LoadStatus mode) {
                        Widget body;
                        if (mode == LoadStatus.idle) {
                          body = Text(
                            "上拉加载",
                          );
                        } else if (mode == LoadStatus.loading) {
                          body = Text("正在加载数据");
                        } else if (mode == LoadStatus.failed) {
                          body = Text("加载失败请重试");
                        } else if (mode == LoadStatus.canLoading) {
                          body = Text("松手加载更多");
                        } else {
                          body = Text("没有更多数据了~~");
                        }
                        return Container(
                          padding: EdgeInsets.only(top: 10),
                          color: Colors.white,
                          height: 1000.0,
                          alignment: Alignment.topCenter,
                          child: body,
                        );
                      },
                    ),
                    enablePullUp: true,
                    controller: _refreshController,
                    onRefresh: _refresh,
                    onLoading: _loading,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: _cellForRow,
                      padding:
                          EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                      itemCount: _dataArray.length,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        onWillPop: _willPop);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
