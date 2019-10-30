import 'package:flutter/material.dart';

class TabPageTestController extends StatefulWidget {

  final String title;

  TabPageTestController({Key key, this.title}): super(key: key);

  @override
  _TabPageTestControllerState createState() => _TabPageTestControllerState();
}

class _TabPageTestControllerState extends State<TabPageTestController> with AutomaticKeepAliveClientMixin {

  List<String> dates = <String>[];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    for (var i = 1; i < 20; i++) {
      dates.add('${widget.title}, item$i');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
//      key: PageStorageKey<String>(widget.title),
      itemCount: dates.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(dates[index]),
          onTap: (){
            final snackBar = SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("点击${dates[index]}"),
                ],
              ),
              duration: Duration(seconds: 1),
            );
            Scaffold.of(context).showSnackBar(snackBar);
          },
        );
      },
    );
  }
}
