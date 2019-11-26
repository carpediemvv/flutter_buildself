
import 'package:flutter/material.dart';
///底部导航框架
class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor =Colors.grey;
  final _activeColor=Colors.blue;
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffedeef0),
              Color(0xffe6e7e9),
            ]
          )
        ),
        child:Center(
          child: Text(
            '你是啥比$_currentIndex',
            style: TextStyle(fontSize: 36,color: Colors.blue),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:_currentIndex,
        onTap: (index){
          //修改状态
          setState(() {
            _currentIndex=index;
          });
        },
        items: [
        _bottomItem('我', Icons.folder, 0),
        _bottomItem('哎', Icons.explore, 1),
        _bottomItem('你', Icons.person, 2),
      ],
      ),
    );
  }
  //封装底部tab
  _bottomItem(String title,IconData icon,int index){
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _defaultColor,
      ),
      activeIcon: Icon(
        icon,
        color: _activeColor,
      ),
      title: Text(title,style: TextStyle(color: _currentIndex!=index?_defaultColor:_activeColor),)
    );
  }
}
