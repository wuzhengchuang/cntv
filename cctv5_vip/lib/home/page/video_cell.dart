import 'package:cctv5_vip/home/model/video.dart';
import 'package:flutter/material.dart';

class VideoCell extends StatelessWidget {
  final Video video;
  final int index;
  VideoCell(this.video, {Key key, this.index}) : super(key: key);
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 15, right: 15, top: index == 0 ? 0 : 10, bottom: 0),
      child: AspectRatio(
        aspectRatio: 16.0 / 9.0,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: video != null
                        ? NetworkImage(video.imgUrl)
                        : AssetImage('images/assets/1.jpeg'),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0xFF000000).withOpacity(0.88),
                      Color(0xFF000000).withOpacity(0.44),
                      Color(0xFF000000).withOpacity(0.0),
                    ]),
              ),
              height: 100,
            ),
            Container(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Text(
                      video != null ? '${video.duration}' : '',
                      style: TextStyle(
                          fontSize: 11,
                          fontFamily: 'PingFangSC',
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 15, right: 50),
                    child: Text(
                      video != null ? '${video.title}' : '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'PingFangSC',
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Image(
                image: AssetImage('images/assets/video_play.png'),
                width: 50,
                height: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
