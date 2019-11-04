import 'package:flutter/material.dart';
import 'package:flutter_app/controller/BusinessPage.dart';
import 'package:flutter_app/controller/HomePage.dart';
import 'package:flutter_app/controller/MePage.dart';
import 'package:flutter_app/widget/ZTabBar.dart';

class MainController extends StatefulWidget {

  final double tabHeight;
  final double textToIconMargin;

  MainController({
    Key key,
    this.tabHeight = 48.0,
    this.textToIconMargin = 0.0,
  }): super(key: key);

  @override
  _MainControllerState createState() => _MainControllerState();
}

class _MainControllerState extends State<MainController> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Material(
          color: Colors.blue,
          child: ZTabBar(
            controller: _tabController,
            labelColor: Colors.redAccent,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.redAccent,
            indicatorWeight: 0.01,
            tabHeight: widget.tabHeight,
            textToIconMargin: widget.textToIconMargin,
            tabs: [
              ZTabHelper(text: "Home", icon: Icon(Icons.home, size: 27,),),
              ZTabHelper(text: "Business", icon: Icon(Icons.business, size: 27,),),
              ZTabHelper(text: "Me", icon: Icon(Icons.person, size: 27,),),
            ]
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
//        physics: NeverScrollableScrollPhysics(),//禁止滑动
        children: [
          HomePage(),
          BusinessPage(),
          MePage(),
        ]
      ),
      floatingActionButton: PopupMenuButton(
        onSelected: (value){
          double _tabHeight = value["tabHeight"];
          double _textToIconMargin = value["textToIconMargin"];
          if (widget.tabHeight != _tabHeight || widget.textToIconMargin != _textToIconMargin) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MainController(tabHeight: _tabHeight, textToIconMargin: _textToIconMargin,),
              ),
            );
          }
        },
        itemBuilder: (BuildContext context) => [
          PopupMenuItem(
            value: {"tabHeight": 48.0, "textToIconMargin": 0.0},
            child: Text("TabBar 高度：48，Tab 标题与图标距离：0.0")
          ),
          PopupMenuItem(
              value: {"tabHeight": 72.0, "textToIconMargin": 0.0},
              child: Text("TabBar 高度：72，Tab 标题与图标距离：0.0")
          ),
          PopupMenuItem(
              value: {"tabHeight": 108.0, "textToIconMargin": 0.0},
              child: Text("TabBar 高度：108，Tab 标题与图标距离：0.0")
          ),
          PopupMenuItem(
              value: {"tabHeight": 108.0, "textToIconMargin": 10.0},
              child: Text("TabBar 高度：108，Tab 标题与图标距离：10.0")
          ),
          PopupMenuItem(
              value: {"tabHeight": 108.0, "textToIconMargin": 20.0},
              child: Text("TabBar 高度：108，Tab 标题与图标距离：20.0")
          ),
        ]
      ),
    );
  }
}
