import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puyang/ExercisePage.dart';

import 'Test/test.dart';
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
    return  DecoratedBox(
        decoration: BoxDecoration(
            image:DecorationImage(
              image: AssetImage('images/bg.jpg'),
              fit: BoxFit.fitHeight
            ),
        ),
        child:
          Padding(padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
          child: Stack(
            children: [
              BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: new Container(
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                drawer: Container(
                  child: Drawer(
                      child:ListView(
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
                  ),
                ),

                floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
                body: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.transparent,
                        Colors.transparent,
                      ])),
                  child: Center(
                    child: Text(
                      'hhahafahha$_currentIndex',
                      style: TextStyle(fontSize: 36, color: Colors.blue),
                    ),
                  ),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: Color(0xdcFFFFFF),
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    //修改状态
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  items: [
                    _bottomItem('我', Icons.folder, 0),
                    _bottomItem('大', Icons.explore, 1),
                    _bottomItem('洗', Icons.person, 2),
                  ],
                ),
              ),
            ],
          ),
        )
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
