import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:puyang/widget/GuidelineBar.dart';
import 'dart:math' as math;

class StatureGuidePage extends StatefulWidget {
  final List<Widget> pageView = [];
  String title = "选择部位";
  String nextText = "选择部位";
  int nextTextbgColor = 300;
  String _selectedBodyPart;

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
          backgroundColor: Colors.teal,
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
                  margin: EdgeInsets.only(
                      bottom: math.max(
                          MediaQueryData.fromWindow(window).padding.bottom - 7,
                          0.0)),
                  height: 80,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        if (_currentIndex == 0) {
                          print(widget._selectedBodyPart.toString());
                          _pageController.jumpToPage(1);
                        } else if (_currentIndex == 1) {
                          _pageController.jumpToPage(2);
                        }
                      },
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Colors.lightBlueAccent,
                                Colors.teal[widget.nextTextbgColor]
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
          child: ChoiceBodyPart(widget),
        )
      ],
    ),
  );

  Center selectBodyPartState() => Center(
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Text("明确您的部位现状，制定合适的计划"),
            Expanded(
              flex: 1,
              child: Center(

              ),
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

  List<String> _sub = <String>['胸', '肩臂', '腰腹', '臂腿'];

  Iterable<Widget> get actorWidgets sync* {
    for (String choiceSub in _sub) {
      yield Padding(
          padding: EdgeInsets.all(8.0),
          child: ChoiceChip(
            backgroundColor: Colors.grey,
            selectedColor: Colors.teal,
            label: Text(choiceSub),
            labelStyle: TextStyle(fontWeight: FontWeight.w200,fontSize: 15.0),
            labelPadding: EdgeInsets.only(left: 20.0,right: 20.0),
            materialTapTargetSize: MaterialTapTargetSize.padded,
            onSelected: (bool value) {
              setState(() {
                _selected = value ? choiceSub : _selected;
                widget._widget._selectedBodyPart=_selected;
              });
            },
            selected: _selected == choiceSub,)
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    widget._widget._selectedBodyPart=_selected;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Wrap(
          children: actorWidgets.toList(),
        ),
      ],
    );
  }
}
