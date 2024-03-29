import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class GuidelineBar extends StatefulWidget {

  final index;

  final List<Widget> view = [];

  final count;

  GuidelineBar({this.index, this.count});

  @override
  _GuidelineBarState createState() {
    return _GuidelineBarState();
  }

}

class _GuidelineBarState extends State<GuidelineBar> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color colorIndex;
    for (int i = 0; i < widget.count; i++) {
      if(widget.index>=i){
        colorIndex=Colors.lightBlueAccent[100];
      }else{
        colorIndex=Colors.grey[200];
      }
      widget.view.add(Expanded(
        flex: 1,
        child: Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          height: 3,
          color: colorIndex,
        ),
      ));
    }
    return Container(
      alignment: Alignment.bottomCenter,
      height: 23,
      child: Flex(
        direction: Axis.horizontal,
        children: widget.view,
      ),
    );
  }


}