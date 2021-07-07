import 'package:cctv5_vip/base/root_provider.dart';
import 'package:cctv5_vip/config/net_config.dart';
import 'package:cctv5_vip/event/page/hovering_header_list_demo.dart';
import 'package:cctv5_vip/home/page/home_page.dart';
import 'package:cctv5_vip/http/http.dart';
import 'package:cctv5_vip/mine/page/mine_page.dart';
import 'package:cctv5_vip/style/vip5_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
        icon: Image(
          image: AssetImage('images/assets/tabbar_home_n.png'),
          width: Vip5ThemeData.TAB_ICON_WIDTH,
          height: Vip5ThemeData.TAB_ICON_HEIGHT,
        ),
        activeIcon: Image(
          image: AssetImage('images/assets/tabbar_home_s.png'),
          width: Vip5ThemeData.TAB_ICON_WIDTH,
          height: Vip5ThemeData.TAB_ICON_HEIGHT,
        ),
        title: Text('首页')),
    BottomNavigationBarItem(
        icon: Image(
          image: AssetImage('images/assets/tabbar_event_n.png'),
          width: Vip5ThemeData.TAB_ICON_WIDTH,
          height: Vip5ThemeData.TAB_ICON_HEIGHT,
        ),
        activeIcon: Image(
          image: AssetImage('images/assets/tabbar_event_s.png'),
          width: Vip5ThemeData.TAB_ICON_WIDTH,
          height: Vip5ThemeData.TAB_ICON_HEIGHT,
        ),
        title: Text('赛程')),
    BottomNavigationBarItem(
        icon: Image(
          image: AssetImage('images/assets/tabbar_mine_n.png'),
          width: Vip5ThemeData.TAB_ICON_WIDTH,
          height: Vip5ThemeData.TAB_ICON_HEIGHT,
        ),
        activeIcon: Image(
          image: AssetImage('images/assets/tabbar_mine_s.png'),
          width: Vip5ThemeData.TAB_ICON_WIDTH,
          height: Vip5ThemeData.TAB_ICON_HEIGHT,
        ),
        title: Text('我的')),
  ];
  List<Widget> _childs = [HomePage(), HoveringHeaderListDemo(), MinePage()];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Http.instance.get(NetConfig().BASEURL, NetConfig().MAINCONFIGJSON,
        success: (data) {
      print(data);
    }, error: (String reason, int statusCode) {
      print(reason);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RootProvider>(builder: (
      _,
      __,
      ___,
    ) {
      int currentIndex =
          Provider.of<RootProvider>(context, listen: false).currentIndex;
      PageController pageController =
          Provider.of<RootProvider>(context, listen: false).pageController;
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Vip5ThemeData.TAB_BG_COLOR,
          elevation: 2,
          selectedFontSize: Vip5ThemeData.TAB_TITLE_SIZE,
          unselectedFontSize: Vip5ThemeData.TAB_TITLE_SIZE,
          selectedItemColor: Vip5ThemeData.TAB_SELECT_COLOR,
          unselectedItemColor: Vip5ThemeData.TAB_UNSELECT_COLOR,
          items: _items,
          currentIndex: currentIndex,
          onTap: (index) {
            Provider.of<RootProvider>(context, listen: false)
                .changeIndex(index);
            pageController.jumpToPage(index);
          },
        ),
        body: PageView(
          controller: pageController,
          children: _childs,
          physics: NeverScrollableScrollPhysics(),
        ),
      );
    });
  }
}
