import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puyang/widget/BlurOvalWidget.dart';
import 'package:puyang/widget/BlurOvalWidgetWithHeight.dart';

import 'ActionLibraryPage.dart';
import 'PlanPage.dart';

///底部导航框架
class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
        ),
        DecoratedBox(
            decoration: BoxDecoration(
//              image: DecorationImage(
//                  image: AssetImage('images/bg.png'), fit: BoxFit.fitHeight),
            ),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                child: _bodyContainer()))
      ],
    );
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
    return Scaffold(
        appBar: BlurOvalWidgetWithHeight(_topbar()),
        backgroundColor: Colors.transparent,
        drawer: _drawer(),
        body: _body(),
        bottomNavigationBar: _bottomContainer());
  }

  //内容
  _body() {
    _pageController = PageController(
        /**视窗比例**/
        viewportFraction: 1);
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.transparent,
          Colors.transparent,
        ])),
        child: PageView(
          physics: BouncingScrollPhysics(),
          onPageChanged: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          controller: _pageController,
          children: <Widget>[
            PlanPage(),
            ActionLibraryPage(),
          ],
        ));
  }

  //底部tabContainer
  _bottomContainer() {
    return BlurOvalWidgetWithHeight(
      BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        currentIndex: _currentIndex,
        onTap: (index) {
          //修改状态
          setState(() {
            _currentIndex = index;
          });
          _pageController.jumpToPage(_currentIndex);
        },
        items: [
          _bottomItem('计划', Icons.assignment_turned_in, 0),
          _bottomItem('训练库', Icons.library_books, 1),
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
