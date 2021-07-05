import 'package:cctv5_vip/home/model/home_event.dart';
import 'package:cctv5_vip/home/page/drag_widget.dart';
import 'package:cctv5_vip/home/page/event_cell.dart';
import 'package:cctv5_vip/home/page/event_more_data_widget.dart';
import 'package:cctv5_vip/tools/vip5_page_tool.dart';
import 'package:flutter/material.dart';

class EventListCell extends StatefulWidget {
  HomeEvent data;
  int index;
  EventListCell(this.data, {Key key, this.index}) : super(key: key);
  @override
  _EventListCellState createState() => _EventListCellState();
}

class _EventListCellState extends State<EventListCell> {
  ScrollController _controller;
  ListView _listView;
  double _radius = 0;
  bool _needJumpToEventPage = false;
  String _moreStr = '查看更多';
  double _rightSpace = -30;
  Widget _cellForRow(BuildContext context, int currentIndex) {
    if (currentIndex < widget.data.data.length) {
      HomeEventItem item =
          HomeEventItem.fromJson(widget.data.data[currentIndex]);
      return EventCell(
        item,
        index: currentIndex,
      );
    } else {
      return GestureDetector(
        onTap: () {
          Vip5PageTool.jumpToPageController(context, 1);
        },
        child: Container(
          width: 30,
          color: Colors.transparent,
        ),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();
    _listView = ListView.builder(
      physics: BouncingScrollPhysics(),
      controller: _controller,
      padding: EdgeInsets.only(left: 15, top: 5, bottom: 14.5, right: 0),
      scrollDirection: Axis.horizontal,
      itemBuilder: _cellForRow,
      itemCount: widget.data.data.length + 1,
    );
  }

  //获取ListView的Content的宽度
  double _getListViewContentWidth(
      double cardWidth, double space, double viewPortWidth) {
    return (widget.data.data.length - 1) * space +
        widget.data.data.length * cardWidth -
        viewPortWidth;
  }

  @override
  Widget build(BuildContext context) {
    double viewPortWidth = MediaQuery.of(context).size.width;
    double listViewContentWidth = _getListViewContentWidth(
        (viewPortWidth - 15 - 10 - 20) / 2, 5, viewPortWidth);
    return Container(
      color: Colors.white,
      height: 125,
      child: Stack(
        alignment: AlignmentDirectional(1.0, -0.4),
        children: [
          Positioned(
              right: _rightSpace,
              child: EventMoreDataWidget(
                child: DragWidget(
                  radius: _radius,
                ),
                moreStr: _moreStr,
              )),
          NotificationListener<ScrollNotification>(
            child: _listView,
            onNotification: (notification) {
              if (listViewContentWidth - notification.metrics.pixels.toInt() <=
                  30) {
                _rightSpace = (notification.metrics.pixels.toInt() -
                            listViewContentWidth) >
                        0
                    ? 0
                    : (notification.metrics.pixels.toInt() -
                        listViewContentWidth);
                if (notification.metrics.pixels.toInt() >
                    listViewContentWidth) {
                  _moreStr = '松开查看';
                  _radius = notification.metrics.pixels.toInt() -
                      listViewContentWidth;
                } else {
                  _radius = 0;
                  _moreStr = '查看更多';
                }
                setState(() {});
              } else {
                if (_rightSpace > -30) {
                  _rightSpace = -30;
                  setState(() {});
                }
              }

              if (notification is ScrollUpdateNotification) {
                //判断松开手指和松开手指的位置
                if (notification.dragDetails == null &&
                    ((notification.metrics.pixels.toInt() -
                            listViewContentWidth) >
                        5)) {
                  _needJumpToEventPage = true;
                }
              }
              if (notification is ScrollEndNotification) {
                if (_needJumpToEventPage) {
                  //停止滑动后跳转到其它页面
                  _needJumpToEventPage = false;
                  Vip5PageTool.jumpToPageController(context, 1);
                }
              }
              return true;
            },
          ),
        ],
      ),
    );
  }
}
