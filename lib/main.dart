import 'package:flutter/material.dart';
import 'package:text_1/docTtruyen/page1.dart';
import 'package:text_1/screens/home_screen.dart';
import 'package:flutter/widgets.dart';
import 'docTtruyen/page2.dart';

void main() {
  //Center is a widget, Text is a widget
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/page1': (context) => Page1(),
        '/page2': (context) => Page2(),
      },
      title: 'Nettruyen',
      home: MyApp()));
}
