import 'dart:math';

import 'package:flutter/material.dart';

class CookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //因为本路由没有使用Scaffold，为了让子级Widget(如Text)使用
    //Material Design 默认的样式风格,我们使用Material作为本路由的根。
    return HomePage();
  }


}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List list = List.generate(Random().nextInt(20)+10, (i) => 'More Item$i');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('listview reorded'),
      ),
      body: Center(
        child: ReorderableListView(
          children: list
              .map((m) => ListTile(
            key: ObjectKey(m),
            title: Text(m),
          )).toList(),//不要忘记 .toList()
          onReorder: _onReorder,
        ),
      ),
    );
  }

  _onReorder(int oldIndex, int newIndex){
    print('oldIndex: $oldIndex , newIndex: $newIndex');
    setState(() {
      if (newIndex == list.length){
        newIndex = list.length - 1;
      }
      var item = list.removeAt(oldIndex);
      list.insert(newIndex, item);
    });
  }
}
