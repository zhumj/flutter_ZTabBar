import 'package:flutter/material.dart';
import 'package:flutter_app/controller/MainController.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (BuildContext context) => "ZTabBar",
      debugShowCheckedModeBanner: false,//去除右上角'DEBUG'水印
      theme: ThemeData(
        platform: TargetPlatform.iOS,//右滑返回
        primarySwatch: Colors.blue,
      ),
      home: MainController(),
    );
  }
}