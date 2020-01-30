import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class PlanPage extends StatefulWidget {
  @override
  _PlanPageState createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage>
    with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Widget divider1 = Divider(color: Colors.blue,);
    Widget divider2 = Divider(color: Colors.green);
    return ListView.separated(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      reverse: false,
      shrinkWrap: true,
      itemCount: 100,
      padding: EdgeInsets.fromLTRB(
          20, 56 + MediaQueryData
          .fromWindow(window)
          .padding
          .top, 20, 56 +
          math.max(MediaQueryData
              .fromWindow(window)
              .padding
              .bottom - 7,
              0.0)),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
            onTap:()=>_tapItem(index),
            title: Text("$index"));
      },
      separatorBuilder: (BuildContext context, int index) {
        return index % 2 == 0 ? divider1 : divider2;
      },
    );
  }

  _tapItem(int index){
    print(index);
    Navigator.pushNamed(context, "Cooking");
  }

}
