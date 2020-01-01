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
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: () {
            //导航到新路由
            Navigator.push( context,
                MaterialPageRoute(builder: (context) {
                  return TestContainerStateful();
                },
                    maintainState:true,
                    fullscreenDialog: true));
          })
        ],
      ),
      drawer: new Drawer(
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
      ),
      floatingActionButton: ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: 88, height: 80),
        child: DecoratedBox(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
              borderRadius: BorderRadius.circular(3),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, offset: Offset(2, 2), blurRadius: 4)
              ]),
          child: Icon(Icons.share),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xffedeef0),
          Color(0xffe6e7e9),
        ])),
        child: Center(
          child: Text(
            'hhahafahha$_currentIndex',
            style: TextStyle(fontSize: 36, color: Colors.blue),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
