import 'package:cctv5_vip/home/model/home_event.dart';
import 'package:cctv5_vip/home/page/drag_widget.dart';
import 'package:cctv5_vip/home/page/event_cell.dart';
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
  EventCell _cellForRow(BuildContext context, int currentIndex) {
    HomeEventItem item = HomeEventItem.fromJson(widget.data.data[currentIndex]);
    return EventCell(
      item,
      index: currentIndex,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();

    _listView = ListView.builder(
      controller: _controller,
      padding: EdgeInsets.only(left: 15, top: 15, bottom: 14.5, right: 15),
      scrollDirection: Axis.horizontal,
      itemBuilder: _cellForRow,
      itemCount: widget.data.data.length,
    );
  }

  //获取ListView的Content的宽度
  double _getListViewContentWidth(
      double cardWidth, double space, double viewPortWidth) {
    return (widget.data.data.length - 1) * space +
        widget.data.data.length * cardWidth -
        viewPortWidth -
        15;
  }

  @override
  Widget build(BuildContext context) {
    double viewPortWidth = MediaQuery.of(context).size.width;
    double listViewContentWidth = _getListViewContentWidth(
        (viewPortWidth - 15 - 10 - 20) / 2, 5, viewPortWidth);

    return Container(
      height: 134.5,
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          DragWidget(
            radius: _radius,
          ),
          NotificationListener(
            child: _listView,
            onNotification: (ScrollNotification notification) {
              if (notification.metrics.pixels.toInt() > listViewContentWidth) {
                print('列表滚动到底部了');
                _radius =
                    notification.metrics.pixels.toInt() - listViewContentWidth;
                setState(() {});
              }
              if (notification is ScrollUpdateNotification) {
                //判断松开手指和松开手指的位置
                if (notification.dragDetails == null &&
                    (notification.metrics.pixels.toInt() -
                            listViewContentWidth) >
                        5) {
                  _needJumpToEventPage = true;
                }
              }
              if (notification is ScrollEndNotification) {
                if (_needJumpToEventPage) {
                  //停止滑动后跳转到其它页面
                  print('跳转到其它页面');
                  _needJumpToEventPage = false;
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
