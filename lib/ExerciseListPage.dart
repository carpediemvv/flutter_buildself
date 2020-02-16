import 'dart:ui';

import 'package:flutter/material.dart';

import 'bean/ActionItemBean.dart';

class ExerciseListPage extends StatelessWidget {

  ActionItemBean actionItemBean;

  ExerciseListPage(this.actionItemBean){
   print("ssdf"+this.actionItemBean.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          //AppBar，包含一个导航栏
          SliverAppBar(
            backgroundColor: Colors.blue,
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title:  Text(actionItemBean.title),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image(
                    image: AssetImage(actionItemBean.coverImage),
                    fit: BoxFit.fitWidth,
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.5),
                        end: Alignment(0.0, 0.0),
                        colors: <Color>[
                          Color(0x60000000),
                          Color(0x00000000),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: MediaQueryData.fromWindow(window).size.width / 2,
                    bottom: 16,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth:
                              MediaQueryData.fromWindow(window).size.width / 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "16个训练动作",
                            style: TextStyle(
                              height: 5,
                              color: Colors.white,
                              fontSize: 18,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "器材：双杠、哑铃",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //List
          SliverFixedExtentList(
            itemExtent: 140.5,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                //创建列表项
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: <Widget>[
                          Image(
                            image: AssetImage(actionItemBean.coverImage),
                            width: 100,
                            height: 100,
                            fit: BoxFit.fitWidth,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("侧身平板支持"),
                                Divider(height: 10),
                                Text("初级 力量 无器材"),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(height: 0.5,)
                  ],
                );
              },
              childCount: 16, //16个列表项
            ),
          ),
        ],
      ),
    );
  }

}
