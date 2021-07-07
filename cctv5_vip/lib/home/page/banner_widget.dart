import 'package:cctv5_vip/home/model/banner.dart' as HomeBanner;
import 'package:cctv5_vip/home/page/banner_bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Vip5BannerWidget extends StatefulWidget {
  HomeBanner.Banner banner;
  Vip5BannerWidget({Key key, this.banner}) : super(key: key);
  @override
  _Vip5BannerWidgetState createState() => _Vip5BannerWidgetState();
}

class _Vip5BannerWidgetState extends State<Vip5BannerWidget> {
  PageController _pageController;
  static final _baseOffset = 10000; //初始化偏移
  static final _initOffset = 0; //初始化索引位
  double _bannerHeight = 0;
  int fixPosition(int realPos, int initPos, int length) {
    final int offset = realPos - initPos;
    int result = offset % length;
    return result < 0 ? length + result : result;
  }

  Widget _cellForRow(BuildContext context, int index) {
    int i = fixPosition(index, _baseOffset, widget.banner.data.length);
    HomeBanner.BannerItem bannerItem =
        HomeBanner.BannerItem.fromJson(widget.banner.data[i]);
    return Vip5BannerItemWidget(
      index: i,
      bannerItem: bannerItem,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: _baseOffset + _initOffset);
  }

  @override
  Widget build(BuildContext context) {
    _bannerHeight =
        (MediaQuery.of(context).size.width - 20 - 20 - 10) * 189.0 / 336 +
            15 +
            10;
    _bannerHeight = double.parse(_bannerHeight.toStringAsFixed(0));
    return Container(
      padding: EdgeInsets.only(top: 10),
      height: _bannerHeight,
      child: Stack(
        children: [
          BannerBgWidget(MediaQuery.of(context).size.width, _bannerHeight),
          Swiper(
            itemBuilder: _cellForRow,
            itemCount: widget.banner.data.length,
            autoplay: true,
            loop: true,
            pagination: SwiperPagination(
              alignment: Alignment.bottomCenter,
              builder: DotSwiperPaginationBuilder(
                  space: 1.5,
                  size: 3,
                  activeSize: 3,
                  color: Color(0xFF666666),
                  activeColor: Color(0xFFEECD9D)),
            ),
            viewportFraction: ((MediaQuery.of(context).size.width - 20 - 20) /
                MediaQuery.of(context).size.width),
            scale: 1.0,
            outer: true,
          )
        ],
      ),
    );
  }
}

class Vip5BannerItemWidget extends StatelessWidget {
  final HomeBanner.BannerItem bannerItem;
  final int index;
  Vip5BannerItemWidget({Key key, this.index, this.bannerItem})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: ResizeImage(Image.network(bannerItem.imgUrl).image,
                width:
                    (MediaQuery.of(context).size.width - 20 - 20 - 10).toInt(),
                height: ((MediaQuery.of(context).size.width - 20 - 20 - 10) *
                            189.0 /
                            336 +
                        15 +
                        10)
                    .toInt()),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(15),
      ),
      // child: Image(
      //     image: NetworkImage(
      //       '${bannerItem.imgUrl}',
      //     ),
      //     fit: BoxFit.fitHeight),
    );
  }
}
