import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Vip5AppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget title;
  final Color backgroundColor;
  Widget leading;
  Vip5AppBar({
    Key key,
    this.title,
    this.backgroundColor = Colors.transparent,
    this.leading,
  }) : super(key: key);
  @override
  _Vip5AppBarState createState() => _Vip5AppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(44);
}

class _Vip5AppBarState extends State<Vip5AppBar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic> parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute.canPop;

    if (widget.leading == null) {
      InkWell inkWell = InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Image(
            fit: BoxFit.fitWidth,
            width: 12,
            image: AssetImage('images/assets/nav_back.png'),
          ),
        ),
      );
      widget.leading = inkWell;
    }

    return Container(
      color: widget.backgroundColor,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            left: 0,
            child: canPop ? widget.leading : Container(),
          ),
          Positioned(
            child: widget.title,
          ),
          Container(),
        ],
      ),
    );
  }
}
