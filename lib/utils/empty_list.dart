import 'package:flutter/material.dart';
import 'package:flutterdriver_test_list/utils/grid.dart';
import 'package:flutterdriver_test_list/utils/strings.dart';

void main() => runApp(new MyEmptyList());



class MyEmptyList extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'FlutterDriver test',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new EmptyList(title: 'FlutterDriver test'),
    );
  }
}

class EmptyList extends StatefulWidget {
  EmptyList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EmptyList createState() => new _EmptyList();
}

class _EmptyList extends State<EmptyList> {
  @override
  List<String> NAMESLIST = null;
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: NAMESLIST != null
          ? new GridView.count(
          key: Key("itens"),
          crossAxisCount: 4,
          children: NAMESLIST.map((String value) {
            return Grid(value, NAMESLIST.indexOf(value));
          }).toList())
          : new Text(EMPTY), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
