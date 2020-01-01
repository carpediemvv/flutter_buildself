import 'package:flutter/material.dart';
import 'package:puyang/ExercisePage.dart';
import 'package:puyang/CookingPage.dart';
import 'package:puyang/tab_navigator.dart';

import 'Test/ongenerateRoute.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,//右上角debug 标志
      debugShowMaterialGrid:false,//网格参考线
      showPerformanceOverlay:false,//帧率
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
     // home: TabNavigator(),
      initialRoute: 'home',
      onGenerateRoute: (RouteSettings settings){
        String routeName = settings.name;
        print(routeName);
        WidgetBuilder builder;
        builder = (BuildContext _) => CollectPersonalInfoPage();
        return MaterialPageRoute(builder: builder, settings: settings);
      },
      routes: {
        "home":(context)=>TabNavigator(),
//        "Exercise":(context)=>ExercisePage(),
//        "Cooking":(context)=>CookingPage()
      },
    );
  }
}
