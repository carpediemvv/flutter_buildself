import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:puyang/bean/ActionItemBean.dart';
import 'dart:math' as math;

import 'bean/ActionLibraryItemBean.dart';

class ActionLibraryPage extends StatefulWidget {
  @override
  _ActionLibraryPageState createState() => _ActionLibraryPageState();
}

class _ActionLibraryPageState extends State<ActionLibraryPage>
    with AutomaticKeepAliveClientMixin {
  List title = ["上肢和胸部强化训练", "腹部和背部核心力量打造", "臀部和腿部肌肉计划"];

  List bgImages = [
    "images/jr-jingbu.png",
    "images/jr-jianbu.png",
    "images/jr-xiongbu.png",
    "images/jr-bibu.png",
    "images/jr-beibu.png",
    "images/jr-fubu.png",
    "images/jr-yaobu.png",
    "images/jr-tunbu.png",
    "images/jr-tuibu.png",
    "images/jr-beibu.png"
  ];

  List topImages = [
    "images/jr-jingbu.png",
    "images/jr-jianbu.png",
    "images/jr-xiongbu.png",
    "images/jr-bibu.png",
    "images/jr-beibu.png",
  ];

  List topTitle = [
    "颈部",
    "肩部",
    "胸部",
    "臂部",
    "背部",
  ];

  List middleImages = [
    "images/jr-fubu.png",
    "images/jr-yaobu.png",
  ];

  List middleTitle = [
    "腹部",
    "腰部",
  ];

  List bottomImages = ["images/jr-tuibu.png", "images/jr-tunbu.png"];

  List bottomTitle = ["腿部", "臀部"];

  List<ActionLibraryItemBean> actionLibraryItemBean = [];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    List<ActionItemBean> topActionItemBeanList = [];
    for (int i = 0; i < topImages.length; i++) {
      ActionItemBean topActionItemBean =
          new ActionItemBean(topTitle[i], topImages[i], "d", "15个训练动作&有器材");
      topActionItemBeanList.add(topActionItemBean);
    }

    List<ActionItemBean> middleActionItemBeanList = [];
    for (int i = 0; i < middleImages.length; i++) {
      ActionItemBean middleActionItemBean =
          new ActionItemBean(middleTitle[i], middleImages[i], "d", "15个训练动作&有器材");
      middleActionItemBeanList.add(middleActionItemBean);
    }

    List<ActionItemBean> bottomActionItemBeanList = [];
    for (int i = 0; i < bottomImages.length; i++) {
      ActionItemBean bottomActionItemBean =
          new ActionItemBean(bottomTitle[i], bottomImages[i], "d", "15个训练动作&有器材");
      bottomActionItemBeanList.add(bottomActionItemBean);
    }

    List listAction = [
      topActionItemBeanList,
      middleActionItemBeanList,
      bottomActionItemBeanList
    ];

    for (int i = 0; i < title.length; i++) {
      actionLibraryItemBean
          .add(new ActionLibraryItemBean(title[i], listAction[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    Widget divider = Divider(
      color: Colors.transparent,
      height: 30,
    );
    return ListView.separated(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      reverse: false,
      shrinkWrap: true,
      itemCount: actionLibraryItemBean.length,
      padding: EdgeInsets.fromLTRB(
          20,
          56 + MediaQueryData.fromWindow(window).padding.top,
          20,
          56 +
              math.max(
                  MediaQueryData.fromWindow(window).padding.bottom - 7, 0.0)),
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  actionLibraryItemBean[index].title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                )),
            actionGridView(index),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return divider;
      },
    );
  }

  _tapItem(int index,ActionItemBean actionItemBean) {
    Navigator.pushNamed(context, "ExerciseListPage",arguments: actionItemBean);
  }

  GridView actionGridView(int index) {
    List<ActionItemBean> actionItemBeans =
        actionLibraryItemBean[index].actionItemBeans;

    return GridView.builder(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      reverse: false,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //横轴三个子widget
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.72 //宽高比为1时，子widget
          ),
      itemCount: actionItemBeans.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Flex(
            crossAxisAlignment: CrossAxisAlignment.start,
            direction: Axis.vertical,
            children: <Widget>[
              Expanded(
                flex: 72,
                child:Image(
                  image: AssetImage(actionItemBeans[index].coverImage),
                  fit: BoxFit.fill,
                )
              ),
              Expanded(
                flex: 28,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,8,0,3),
                      child: Text(actionItemBeans[index].title),
                    ),
                    Text(actionItemBeans[index].exerciseDescription,style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey
                    ),),
                  ],
                )
              )
            ],
          ),
          onTap:()=>_tapItem(index,actionItemBeans[index]),
        );
      },
    );
  }
}
