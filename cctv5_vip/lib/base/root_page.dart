import 'package:cctv5_vip/event/page/event_page.dart';
import 'package:cctv5_vip/home/page/home_page.dart';
import 'package:cctv5_vip/mine/page/mine_page.dart';
import 'package:cctv5_vip/style/vip5_theme_data.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 0;
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
  List<Widget> _childs = [HomePage(), EventPage(), MinePage()];
  PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Vip5ThemeData.TAB_BG_COLOR,
        elevation: 0,
        selectedFontSize: Vip5ThemeData.TAB_TITLE_SIZE,
        unselectedFontSize: Vip5ThemeData.TAB_TITLE_SIZE,
        selectedItemColor: Vip5ThemeData.TAB_SELECT_COLOR,
        unselectedItemColor: Vip5ThemeData.TAB_UNSELECT_COLOR,
        items: _items,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(_currentIndex);
          });
        },
      ),
      body: PageView(
        controller: _pageController,
        children: _childs,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
