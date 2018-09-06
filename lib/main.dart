import 'package:flutter/material.dart';
import 'package:post_list/strings.dart';

void main() => runApp(new MyApp());

String _selected = "";

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'FlutterDriver test',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'FlutterDriver test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: NAMESLIST != null
          ? new ListView(
              key: Key("itens"),
              children: NAMESLIST.map((String value) {
                return listView(value, NAMESLIST.indexOf(value));
              }).toList())
          : new Text(
              EMPTY), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget listView(String value, int index) {
    return new GestureDetector(
      key: new Key("ITEM_$index"),
      onTap: () {
        setState(() {
          _selected = _selected == "ITEM_$index" ? null : "ITEM_$index";
        });
      },
      child: new Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: _selected == "ITEM_$index"
                ? Colors.deepOrange
                : new Color(0x33000000)),
        padding: const EdgeInsets.all(2.0),
        //color: _selected == "ITEM_$index" ? Colors.deepOrange : new Color(0x33000000),
        margin: EdgeInsets.all(5.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text(value),
        ),
      ),
    );
  }
}
