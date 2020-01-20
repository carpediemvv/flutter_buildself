import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puyang/widget/BlurOvalWidget.dart';
import 'dart:math' as math;
///底部导航框架
class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/bg1.jpg'), fit: BoxFit.fitHeight),
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
            child: _bodyContainer()));
  }

  //顶部导航栏
  _topbar() {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            color: Colors.black,
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      backgroundColor: Colors.white30,
      elevation: 0,
    );
  }

  //侧滑导航
  _drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(child: Text('Nick Name')),
          ListTile(
            title: Text('Exercise'),
            onTap: () {
              Navigator.of(context).pushNamed("1Exercise");
            },
          ),
          ListTile(
            title: Text('Cooking'),
            onTap: () {
              Navigator.pushNamed(context, "Cooking");
            },
          ),
        ],
      ),
    );
  }

  //内容top
  _bodyContainer() {
    AppBar appBar = _topbar();
    BlurOvalWidget blurOvalWidget =_bottomContainer();
    return Scaffold(
        appBar: BlurOvalWidget(appBar),
        backgroundColor: Colors.transparent,
        drawer: _drawer(),
        body: _body(appBar.preferredSize.height),
        bottomNavigationBar: blurOvalWidget);
  }

  //内容
  _body(var appbarHeight) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.transparent,
          Colors.transparent,
        ])),
        child: ListView(
          scrollDirection: Axis.vertical,
          reverse: false,
          shrinkWrap: true,
          itemExtent: 80,
          padding: EdgeInsets.fromLTRB(
              20,
              appbarHeight + MediaQueryData.fromWindow(window).padding.top,
              20,
              56+math.max(MediaQueryData.fromWindow(window).padding.bottom-7,0.0)),
          children: <Widget>[
            Container(
              color: Colors.red,
              width: 200,
              height: 200,
              child: Text("1hello world"),
            ),
            Container(
              color: Colors.black12,
              width: 200,
              height: 200,
              child: Text("hello world"),
            ),
            Container(
              color: Colors.orange,
              width: 200,
              height: 200,
              child: Text("hello world"),
            ),
            Container(
              color: Colors.amber,
              width: 200,
              height: 200,
              child: Text("hello world"),
            ),
            Container(
              color: Colors.cyan,
              width: 200,
              height: 200,
              child: Text("hello world"),
            ),
            Container(
              color: Colors.blue,
              width: 200,
              height: 200,
              child: Text("hello world"),
            ),
          ],
        ));
  }

  //底部tabContainer
  _bottomContainer(){
    return BlurOvalWidget(
      BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        currentIndex: _currentIndex,
        onTap: (index) {
          //修改状态
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          _bottomItem('1fd', Icons.folder, 0),
          _bottomItem('ae', Icons.explore, 1),
          _bottomItem('lkl', Icons.person, 2),
        ],
      ),
    );
  }

  //封装底部tab
  _bottomItem(String title, IconData icon, int index) {
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          color: _defaultColor,
        ),
        activeIcon: Icon(
          icon,
          color: _activeColor,
        ),
        title: Text(
          title,
          style: TextStyle(
              color: _currentIndex != index ? _defaultColor : _activeColor),
        ));
  }
}
