import 'package:flutter/material.dart';
import 'package:flutter_app/controller/home/TabPageTestController.dart';
import 'package:flutter_app/widget/ZTabBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {

  @override
  bool get wantKeepAlive => true;

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.index = 0;
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.blue,//导航栏背景色
        elevation: 0,//隐藏阴影
        title: Text("Home", style: TextStyle(color: Colors.white, fontSize: 21), textAlign: TextAlign.center,),//标题
        centerTitle: true,//标题是否居中
        brightness: Brightness.light,//状态栏字体颜色
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              floating: true,
              primary: false,
              snap: false,
              backgroundColor: Colors.white,
              expandedHeight: MediaQuery.of(context).size.width/2 + 50,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Container(//头部整个背景颜色
                  height: double.infinity,
                  color: Color(0xffcccccc),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.redAccent,
                          child: Text('轮播图'),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        width: double.infinity,
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
              bottom: ZTabBar(
                  controller: _tabController,
                  labelColor: Colors.redAccent,
                  unselectedLabelColor: Colors.black,
                  indicatorColor: Colors.redAccent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    ZTabHelper(text: "Tab1"),
                    ZTabHelper(text: "Tab2"),
                    ZTabHelper(text: "Tab3"),
                  ]
              ),
            )
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            TabPageTestController(title: 'Tab1',),
            TabPageTestController(title: 'Tab2',),
            TabPageTestController(title: 'Tab3',),
          ],
        ),
      ),
    );
  }
}
