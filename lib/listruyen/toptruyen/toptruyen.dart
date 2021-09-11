import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:text_1/listruyen/toptruyen/top_truyen.dart';

class ListTopTruyen extends StatefulWidget {
  @override
  DanhSachTopTruyen createState() => DanhSachTopTruyen();
}

class DanhSachTopTruyen extends State with TickerProviderStateMixin {
  var listTruyen = listTopTruyen;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    // indexCurrent = 0;
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
              color: Colors.grey[300],
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TabBarView(controller: _tabController, children: <Widget>[
              ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                        height: (MediaQuery.of(context).size.height) *
                            0.01 // (MediaQuery.of(context).size.height) ,
                        );
                  },
                  scrollDirection: Axis.vertical,
                  itemCount: listTruyen.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        decoration: BoxDecoration(
                          color: (index) < 3
                              ? (index) == 1
                                  ? Colors.green[100]
                                  : ((index) == 2
                                      ? Colors.red[100]
                                      : Colors.blue[100])
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: (MediaQuery.of(context).size.height) * 0.99 / 7,
                        //elevation: 3,

                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Padding(padding: EdgeInsets.only(left: 5)),
                              Text(
                                '0${(index + 1)}',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: (index) < 3
                                        ? (index) == 1
                                            ? Colors.green
                                            : ((index) == 2
                                                ? Colors.red
                                                : Colors.blue)
                                        : Colors.black),
                              ),
                              Padding(padding: EdgeInsets.all(5)),
                              Container(
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: Image.network(listTruyen[index].url1,
                                    width: 80, height: 60, fit: BoxFit.cover),
                              ),
                              Padding(padding: EdgeInsets.all(5)),
                              Expanded(
                                child: Column(
                                  /*   mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,*/
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                        listTruyen[index].name1,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(15)),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                              child: Row(
                                            children: [
                                              Container(
                                                child: Text(
                                                    'Chapter: ${listTruyen[index].chapter1}'),
                                              ),
                                            ],
                                          )),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 40, bottom: 10)),
                                          Expanded(
                                              child: Row(
                                            children: [
                                              Icon(Icons.remove_red_eye,
                                                  size: 15),
                                              Container(
                                                  child: Text(
                                                      listTruyen[index].view))
                                            ],
                                          ))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ));
                  }),
              Text('bbbbb'),
              Text('ccccc'),
            ]))
      ]),
    );
  }
}
