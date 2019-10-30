import 'package:flutter/material.dart';

class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.blue,//导航栏背景色
        elevation: 0,//隐藏阴影
        title: Text("Me", style: TextStyle(color: Colors.white, fontSize: 21), textAlign: TextAlign.center,),//标题
        centerTitle: true,//标题是否居中
        brightness: Brightness.light,//状态栏字体颜色
      ),
      body: ListView.builder(
        itemCount: 25,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("Item$index"),
            onTap: (){
              final snackBar = SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("点击Item$index"),
                  ],
                ),
                duration: Duration(seconds: 1),
              );
              Scaffold.of(context).showSnackBar(snackBar);
            },
          );
        },
      )
    );
  }
}
