import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class PlanPage extends StatefulWidget {
  @override
  _PlanPageState createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
        ),
        DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/bg.png'), fit: BoxFit.fill),
            ),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                child: buildBody()))
      ],
    );
  }

  Stack buildBody() {
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQueryData.fromWindow(window).size.width,
              height: 200.0,
              child: Column(
                children: <Widget>[
                  DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.lightBlueAccent,
                            Colors.blue[700]
                          ]),
                          //背景渐变
                          borderRadius: BorderRadius.circular(40.0),
                          //3像素圆角
                          boxShadow: [
                            //阴影
                            BoxShadow(
                                color: Colors.black54,
                                offset: Offset(2.0, 2.0),
                                blurRadius: 4.0)
                          ]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 12.0),
                        child: Text(
                          "添加训练计划",
                          style: TextStyle(color: Colors.white),
                        ),
                      ))
                ],
              )),
        )
      ],
    );
  }
}
