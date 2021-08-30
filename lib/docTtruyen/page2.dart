import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dotted_decoration/dotted_decoration.dart';

class Page2 extends StatefulWidget {
  @override
  _PaGe2 createState() => _PaGe2();
}

class _PaGe2 extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink.shade900,
          title: Text('Thông tin truyện'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  print('Clicked search');
                },
                icon: Icon(
                  Icons.search,
                  size: 30,
                )),
            IconButton(
                onPressed: () {
                  print('Clicked list');
                },
                icon: Icon(Icons.reorder_sharp,
                    size: 30, color: Colors.yellow.shade200))
          ],
        ),
        body: SingleChildScrollView(child: Column(children: [Text('abc')])));
  }
}
