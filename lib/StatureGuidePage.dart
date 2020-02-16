import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puyang/widget/GuidelineBar.dart';

class StatureGuidePage extends StatefulWidget {
  final List<Widget> pageView = [];
  String title = "选择部位";
  String nextText = "选择部位";
  int nextTextbgColor = 300;

  @override
  State<StatefulWidget> createState() => _StatureGuidePageState();
}

class _StatureGuidePageState extends State<StatureGuidePage> {
  PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.pageView.add(selectBodyPart());
    widget.pageView.add(selectBodyPartState());
    widget.pageView.add(manageTime());
  }

  @override
  Widget build(BuildContext context) {
    _pageController = PageController(
        /**视窗比例**/
        viewportFraction: 1);

    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(widget.title),
        ),
        body: Container(
            padding: EdgeInsets.only(
                top: 56 + MediaQueryData.fromWindow(window).padding.top),
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                GuidelineBar(
                  index: _currentIndex,
                  count: widget.pageView.length,
                ),
                Expanded(
                  flex: 1,
                  child: PageView(
                    onPageChanged: (int index) {
                      if (index == 0) {
                        widget.title = "选择部位";
                        widget.nextText = "选择部位";
                        widget.nextTextbgColor = 300;
                      } else if (index == 1) {
                        widget.title = "选择部位状态";
                        widget.nextText = "确定状态";
                        widget.nextTextbgColor = 600;
                      } else if (index == 2) {
                        widget.title = "设定时间";
                        widget.nextText = "生成计划";
                        widget.nextTextbgColor = 900;
                      }
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    controller: _pageController,
                    children: widget.pageView,
                  ),
                ),
                Container(
                  height: 80,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        if (_currentIndex == 0) {
                          _pageController.jumpToPage(1);
                        } else if (_currentIndex == 1) {
                          _pageController.jumpToPage(2);
                        }
                      },
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Colors.lightBlueAccent,
                                Colors.blue[widget.nextTextbgColor]
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
                              widget.nextText,
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

Center selectBodyPart() => Center(
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Text("确认您要改变的部位，一次只能选取一处"),
          Expanded(
            flex: 1,
            child: Center(
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20,8.0,10,20),
                      child: Image(
                        image: AssetImage("images/front.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20,8.0,10,20),
                      child: Image(
                        image: AssetImage("images/back.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            child: Wrap(
              children: <Widget>[Text("胸"),Text("肩臂"),Text("腰腹"), Text("臂腿"),],
            ),
          )
        ],
      ),
    );

Center selectBodyPartState() => Center(
      child: Text("bbb"),
    );

Center manageTime() => Center(
      child: Text("ccc"),
    );
