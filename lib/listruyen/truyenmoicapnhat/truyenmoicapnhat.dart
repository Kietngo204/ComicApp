import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:text_1/DocTruyen/page1.dart';
import 'package:text_1/DocTruyen/thongtintruyen.dart';
import 'package:text_1/listruyen/truyenmoicapnhat/Request_truyenmoicapnhat.dart';

import 'Api_truyenmoicapnhat.dart';

class TruyenMoiCapNhat extends StatefulWidget {
  @override
  TruyenCapNhat createState() => TruyenCapNhat();
}

class TruyenCapNhat extends State {
  // var dataNewTruyen = dataTruyenMoi;
  var _controller = ScrollController();
  late ListTruyenMoiCapNhat _truyenCapNhat;
  @override
  void initState() {
    super.initState();
    TruyenMoiCapNhatRequest.fetchDataTruyenMoiCapNhat()
        .then((datafromTruyenMoiCapNhat) {
      setState(() {
        _truyenCapNhat = datafromTruyenMoiCapNhat;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                const Text(
                  'TRUYỆN MỚI CẬP NHẬT ',
                  style: TextStyle(color: Colors.blue, fontSize: 25),
                ),
              ],
            ),
          ),
          Container(
            child: _truyenCapNhat.errorCode == 0
                ? SizedBox(
                    height: (MediaQuery.of(context).size.height) * 5 + 400,
                    width: MediaQuery.of(context).size.width - 20,
                    child: GridView.builder(
                        itemCount: _truyenCapNhat.data.length,
                        shrinkWrap: true,
                        controller: _controller,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                // Navigator.pushNamed(context, data.routeName);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Thongtintruyen(
                                        chitiet: _truyenCapNhat.data[index])));
                              },
                              child: Container(

                                  // height: (MediaQuery.of(context).size.height / 6),
                                  // padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                                _truyenCapNhat
                                                    .data[index].urlImg,
                                                fit: BoxFit.cover,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 100),
                                          ),
                                          Positioned(
                                              bottom: 0,
                                              right: 0,
                                              left: 0,
                                              child: Container(
                                                height: 20,
                                                decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(0.5)),
                                              )),
                                          Container(
                                              alignment: Alignment.bottomCenter,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                /*  crossAxisAlignment:
                                          CrossAxisAlignment.start, */
                                                children: [
                                                  Icon(Icons.remove_red_eye,
                                                      color: Colors.white,
                                                      size: 11),
                                                  Text(
                                                      _truyenCapNhat
                                                          .data[index].view,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11)),
                                                  Icon(Icons.comment,
                                                      color: Colors.white,
                                                      size: 11),
                                                  Text(
                                                      _truyenCapNhat
                                                          .data[index].comment,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11)),
                                                  Icon(Icons.favorite,
                                                      color: Colors.white,
                                                      size: 11),
                                                  Text(
                                                      _truyenCapNhat
                                                          .data[index].heart,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11)),
                                                ],
                                              ))
                                        ],
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.only(left: 5, right: 2),
                                        child: Row(
                                          children: [
                                            Flexible(
                                                child: Text(
                                                    _truyenCapNhat
                                                        .data[index].tenTruyen,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold)))
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          ListView.builder(
                                            padding: EdgeInsets.only(
                                                left: 5, right: 5),
                                            shrinkWrap: true,
                                            controller: _controller,
                                            itemCount: _truyenCapNhat
                                                .data[index].details.length,
                                            itemBuilder:
                                                (BuildContext context, int i) {
                                              return Container(
                                                padding:
                                                    EdgeInsets.only(top: 2),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      _truyenCapNhat.data[index]
                                                          .details[i].chapter,
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                    Text(
                                                      _truyenCapNhat.data[index]
                                                          .details[i].timer,
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  )));
                        }))
                : Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(_truyenCapNhat.errorMsg),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: 60,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(5)),
                          child: GestureDetector(
                            child: Icon(
                              Icons.refresh,
                              color: Colors.white,
                            ),
                            onTap: () {
                              TruyenMoiCapNhatRequest
                                      .fetchDataTruyenMoiCapNhat()
                                  .then((dataFromTruyenCapNhat) {
                                setState(() {
                                  //dataTruyenDeCu = dataFromTruyenDeCu;
                                  _truyenCapNhat = dataFromTruyenCapNhat;
                                });
                              });
                            },
                          ))
                    ],
                  )),
          )
        ],
      ),
    );
  }
}
