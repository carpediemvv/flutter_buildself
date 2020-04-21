import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:puyang/widget/GuidelineBar.dart';
import 'dart:math' as math;

import 'widget/SelectChoiceChipWidget.dart';

class StatureGuidePage extends StatefulWidget {
  final List<Widget> pageView = [];
  String title = "选择部位";
  String nextText = "选择部位";
  String _selectedBodyPart;
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
  }

  @override
  Widget build(BuildContext context) {
    if (widget.pageView.length == 0) {
      widget.pageView.add(ChoiceBodyPart(widget));
      widget.pageView.add(selectBodyPartState());
      widget.pageView.add(manageTime());
    }
    _pageController = PageController(
        /**视窗比例**/
        viewportFraction: 1);

    return Material(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          brightness: Brightness.dark,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.black),
          ),
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
                        widget.nextTextbgColor = 400;
                      } else if (index == 2) {
                        widget.title = "设定时间";
                        widget.nextText = "生成计划";
                        widget.nextTextbgColor = 500;
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
                  margin: EdgeInsets.only(
                      bottom: math.max(
                              MediaQueryData.fromWindow(window).padding.bottom -
                                  7, 0.0) + 20),
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
                                    offset: Offset(0.0, 1.0),
                                    blurRadius: 2.0)
                              ]),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 80.0, vertical: 12.0),
                            child: Text(
                              widget.nextText,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
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

  Center selectBodyPartState() => Center(
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Text("明确您的部位现状，制定合适的计划"),
            Expanded(
              flex: 1,
              child: Center(),
            ),
          ],
        ),
      );

  Center manageTime() => Center(
        child: Text("ccc"),
      );
}

class ChoiceBodyPart extends StatefulWidget {
  final StatureGuidePage _widget;

  ChoiceBodyPart(this._widget);

  _ChoiceBodyPart createState() => _ChoiceBodyPart();
}

class _ChoiceBodyPart extends State<ChoiceBodyPart> {
  String _selected = '胸';
  final List<String> bodyA = [
    "images/body/pectorales-A.png",
    "images/body/arm-A.png",
    "images/body/back-A.png",
    "images/body/leg-A.png"
  ];
  final List<String> bodyB = [
    "images/body/pectorales-B.png",
    "images/body/arm-B.png",
    "images/body/back-B.png",
    "images/body/leg-B.png"
  ];
  List<String> _sub = <String>['胸', '肩臂', '腰腹', '臂腿'];

  Iterable<Widget> get actorWidgets sync* {
    for (String choiceSub in _sub) {
      yield Padding(
          padding: EdgeInsets.all(8.0),
          child: SelectChoiceChip(
            text: choiceSub,
            onSelected: (bool value) {
              setState(() {
                _selected = value ? choiceSub : _selected;
                widget._widget._selectedBodyPart = _selected;
              });
            },
            selected: _selected == choiceSub,
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    widget._widget._selectedBodyPart=_selected;
    return Center(
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: Text("确认您要改变的部位",
                  style: TextStyle(color: Colors.black, fontSize: 20)),
            ),
          ),
          Container(
            child: Center(
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 8.0, 10, 20),
                      child: Stack(
                        children: <Widget>[
                          Image(
                            image: AssetImage("images/body/body-A.png"),
                            fit: BoxFit.fill,
                          ),
                          Image(
                            image: AssetImage(bodyA[_sub.indexOf(_selected)]),
                            fit: BoxFit.fill,
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 8.0, 10, 20),
                      child: Stack(
                        children: <Widget>[
                          Image(
                            image: AssetImage("images/body/body-B.png"),
                            fit: BoxFit.fill,
                          ),
                          Image(
                            image: AssetImage(bodyB[_sub.indexOf(_selected)]),
                            fit: BoxFit.fill,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Wrap(
                  children: actorWidgets.toList(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
