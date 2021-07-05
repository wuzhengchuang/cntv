import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Vip5LoadingDialog extends Dialog {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop(context);
      },
      child: Material(
        color: Colors.red.withOpacity(0.3),
        child: GestureDetector(
          onTap: () {},
          child: Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Vip5CircleAnimation(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '正在加载中...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Vip5CircleAnimation extends StatefulWidget {
  @override
  _Vip5CircleAnimationState createState() => _Vip5CircleAnimationState();
}

class _Vip5CircleAnimationState extends State<Vip5CircleAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animationController
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _animationController.reset();
            _animationController.forward();
          }
        }),
      child: Image(
        image: AssetImage('images/assets/loading.png'),
        width: 30,
        height: 30,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    print('Vip5CircleAnimation销毁了');
    super.dispose();
  }
}
