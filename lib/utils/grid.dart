import 'package:flutter/material.dart';
class Grid extends StatefulWidget {

  Grid(this.value, this.index);

  final String value;
  final int index;

  @override
  State<StatefulWidget> createState() {
    return _Grid();
  }

}

class _Grid extends State<Grid> {
  String _selected = "";

  @override
  Widget build(BuildContext context) {
    Border border = Border.all(width: 0.0);
    double elevation = 0.0;

    if (_selected == "ITEM_${widget.index}") {
      border = Border.all(color: Colors.red, width: 2.0);
      elevation = 5.5;
    }

    return new GestureDetector(
      key: new Key("ITEM_${widget.index}"),
      onTap: () {
        setState(() {
          _selected = _selected == "ITEM_${widget.index}" ? null : "ITEM_${widget.index}";;
        });
      },
      child: new Card(
        shape: border,
        elevation: elevation,
        child: new GridTile(
          footer: Center(
            child: Padding(
              padding: new EdgeInsets.all(5.0),
              child: new Text(
                widget.value,
              ),
            ),
          ),
          child: new Container(
            margin:
            EdgeInsets.only(top: 0.0, bottom: 5.0, left: 0.0, right: 0.0),
            child: new Icon(Icons.account_circle,
                color: const Color(0xFF000000), size: 50.0),
          ),
        ),
      ),
    );
  }
}