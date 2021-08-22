import 'package:flutter/material.dart';
import 'package:text_1/doc%20truyen/page1.dart';
import 'package:text_1/screens/home_screen.dart';

import 'doc truyen/page2.dart';

void main() {
  //Center is a widget, Text is a widget
  runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/page1': (context) => Page1(),
        '/page2': (context) => Page2(),
      },
      title: 'Nettruyen',
      home: MyApp()));
}
