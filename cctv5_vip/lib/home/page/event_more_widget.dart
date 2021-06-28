import 'package:cctv5_vip/base/PageDataWidget.dart';
import 'package:cctv5_vip/home/page/event_more_data_widget.dart';
import 'package:cctv5_vip/tools/vip5_page_tool.dart';
import 'package:flutter/material.dart';

class EventMoreWidget extends StatelessWidget {
  final String moreStr;
  EventMoreWidget({
    Key key,
    this.moreStr = '查看更多',
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String moreStr = EventMoreDataWidget.of(context).moreStr;
    return Container(
      width: 30,
      alignment: Alignment.center,
      child: Center(
        child: Container(
          width: 18,
          child: InkWell(
            child: Center(
              child: Text(
                '$moreStr',
                maxLines: 4,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Color(0xFF333333)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
