import 'package:flutter/material.dart';
import 'package:text_1/listruyen/toptruyen/topday/Api_topday.dart';

import 'Request_topday.dart';

class ListTopDay extends StatefulWidget {
  const ListTopDay({Key? key}) : super(key: key);

  @override
  _ListTopDayState createState() => _ListTopDayState();
}

class _ListTopDayState extends State<ListTopDay> with TickerProviderStateMixin {
  TopDay _topDay = TopDay(
      data: [],
      errorCode: -1001,
      errorMsg: 'Không thể kết nối đến hệ thống đọc truyện');
  late bool iLoading;
  @override
  void initState() {
    super.initState();

    // indexCurrent = 0;
    TopDayRequest.fetchTopDay().then((dataFromTopDay) {
      setState(() {
        _topDay = dataFromTopDay;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _topDay.errorCode == 0
        ? Container(
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                      height: (MediaQuery.of(context).size.height) *
                          0.01 // (MediaQuery.of(context).size.height) ,
                      );
                },
                scrollDirection: Axis.vertical,
                itemCount: _topDay.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        color: (index) < 3
                            ? (index) == 1
                                ? Colors.green[100]
                                : ((index) == 2
                                    ? Colors.red[100]
                                    : Colors.blue[100])
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: (MediaQuery.of(context).size.height) * 0.99 / 7,
                      //elevation: 3,

                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(left: 5)),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
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
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(5)),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 5, bottom: 5),
                                    child: Image.network(
                                        _topDay.data[index].urlImg,
                                        width: 80,
                                        height: 70,
                                        fit: BoxFit.cover),
                                  ),
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(5)),
                            Expanded(
                              flex: 6,
                              child: Column(
                                /*   mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,*/
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Container(
                                        width:
                                            (MediaQuery.of(context).size.width +
                                                    50) /
                                                2,
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text(
                                          _topDay.data[index].tenTruyen,
                                          maxLines: 1,
                                          softWrap: false,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.all(15)),
                                  Container(
                                    //margin: EdgeInsets.only(bottom: 10),
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: [
                                            Container(
                                              child: Text(
                                                  '${_topDay.data[index].details[0].chapter}',
                                                  style:
                                                      TextStyle(fontSize: 14)),
                                            ),
                                          ],
                                        ),
                                        /*  Padding(
                                            padding: EdgeInsets.only(
                                                left: 22, bottom: 10)), */
                                        Container(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Row(
                                            children: [
                                              Icon(Icons.remove_red_eye,
                                                  size: 13),
                                              Container(
                                                  child: Text(
                                                _topDay.data[index].view,
                                                style: TextStyle(fontSize: 13),
                                              ))
                                            ],
                                          ),
                                        )
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
          )
        : Center(child: CircularProgressIndicator());
  }
}
