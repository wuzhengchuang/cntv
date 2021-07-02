import 'package:cctv5_vip/base/right_to_left_router.dart';
import 'package:cctv5_vip/event/page/event_detail_page.dart';
import 'package:cctv5_vip/extension/size_string.dart';
import 'package:cctv5_vip/home/model/home_event.dart';
import 'package:cctv5_vip/home/page/border_widget.dart';
import 'package:cctv5_vip/home/page/circle_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class EventCell extends StatelessWidget {
  HomeEventItem data;
  int index;
  EventCell(this.data, {Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double tiemStrWidth = data.timeStr.width(12, FontWeight.normal);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(RightToLeftRouter(child: EventDetailPage()));
      },
      child: Container(
        padding: EdgeInsets.only(right: 5),
        width: (MediaQuery.of(context).size.width - 15 - 10 - 20) / 2,
        child: BorderWidget(
          borderWidth: 0.5,
          borderRadius: 5,
          borderColor: Color(0xFFE5E5E5),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10, top: 8),
                          constraints: BoxConstraints(
                              maxWidth: (MediaQuery.of(context).size.width -
                                          15 -
                                          10 -
                                          20) /
                                      2 -
                                  20 -
                                  tiemStrWidth),
                          child: Text(
                            data.title,
                            maxLines: 1,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12, color: Color(0xFF666666)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 10, top: 8),
                          constraints: BoxConstraints(
                            maxWidth: tiemStrWidth,
                          ),
                          child: Text(
                            data.timeStr,
                            maxLines: 1,
                            textAlign: TextAlign.right,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12,
                                color: int.parse(data.status) == 0
                                    ? Color(0xFFFF4A4A)
                                    : Color(0xFF999999)),
                          ),
                        )
                      ],
                    )),
                Expanded(
                    flex: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: data.isThird > 0
                          ? [
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    CircleImage(
                                      image: NetworkImage('${data.homeIcon}'),
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      constraints: BoxConstraints(
                                          maxWidth: (MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      15 -
                                                      10 -
                                                      20) /
                                                  2 -
                                              55),
                                      child: Text(
                                        '${data.homeName}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF333333),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    CircleImage(
                                      image: NetworkImage('${data.awayIcon}'),
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      constraints: BoxConstraints(
                                          maxWidth: (MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      15 -
                                                      10 -
                                                      20) /
                                                  2 -
                                              55),
                                      child: Text(
                                        '${data.awayName}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF333333),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]
                          : [
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    CircleImage(
                                      image:
                                          NetworkImage('${data.scheduleIcon}'),
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      constraints: BoxConstraints(
                                          maxWidth: (MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      15 -
                                                      10 -
                                                      20) /
                                                  2 -
                                              55),
                                      child: Text(
                                        '${data.round}',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF333333),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
