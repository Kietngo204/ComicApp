import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'topmonth/topmonth.dart';

class ListTopTruyen extends StatefulWidget {
  @override
  DanhSachTopTruyen createState() => DanhSachTopTruyen();
}

class DanhSachTopTruyen extends State with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              const Text(
                'TRUYỆN ĐỌC NHIỀU NHẤT ',
                style: TextStyle(color: Colors.blue, fontSize: 25),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.blue, style: BorderStyle.solid),
            // borderRadius: BorderRadius.circular(10),
          ),
          height: 40,

          //color: Colors.blue,
          child: TabBar(
              isScrollable: true,
              indicatorWeight: 3.0,
              indicatorColor: Colors.blue,
              labelPadding: EdgeInsets.all(10),
              controller: _tabController,
              tabs: <Widget>[
                Text('Top tháng', style: TextStyle(color: Colors.blue)),
                Text('Top tuần', style: TextStyle(color: Colors.green)),
                Text('Top ngày', style: TextStyle(color: Colors.red)),
              ]),
        ),
        Padding(padding: EdgeInsets.all(3)),
        Container(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            height: (((MediaQuery.of(context).size.height) * 0.99 / 2) +
                (((MediaQuery.of(context).size.height) * 0.01) * 6) +
                40),
            width: MediaQuery.of(context).size.width - 20,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TabBarView(controller: _tabController, children: <Widget>[
              ListTopMonth(),
              Text('bbbbb'),
              Text('ccccc'),
            ]))
      ]),
    );
  }
}
