import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:text_1/doc%20truyen/page1.dart';
import 'package:text_1/models/truyen_moi_cap_nhat.dart';

class TruyenMoiCapNhat extends StatefulWidget {
  @override
  TruyenCapNhat createState() => TruyenCapNhat();
}

class TruyenCapNhat extends State {
  var dataNewTruyen = dataTruyenMoi;
  var _controller = ScrollController();

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
          SizedBox(
              height: (MediaQuery.of(context).size.height +
                  (MediaQuery.of(context).size.height / 2) +
                  40),
              width: MediaQuery.of(context).size.width - 20,
              child: GridView.count(
                  shrinkWrap: true,
                  controller: _controller,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  //padding: EdgeInsets.all(10),
                  crossAxisCount: 2,
                  children: dataNewTruyen
                      .map((data) => GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, data.routeName);
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
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(data.url,
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
                                                  size: 12),
                                              Text(data.view,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12)),
                                              Icon(Icons.comment,
                                                  color: Colors.white,
                                                  size: 12),
                                              Text(data.cmt,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12)),
                                              Icon(Icons.favorite,
                                                  color: Colors.white,
                                                  size: 12),
                                              Text(data.like,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12)),
                                            ],
                                          ))
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 5, right: 2),
                                    child: Row(
                                      children: [
                                        Flexible(
                                            child: Text(data.name,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)))
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Wrap(
                                          direction: Axis.vertical,
                                          spacing: 5,
                                          children: [
                                            Text(data.chapter1,
                                                style: TextStyle(fontSize: 11)),
                                            Text(data.chapter2,
                                                style: TextStyle(fontSize: 11)),
                                            Text(data.chaper3,
                                                style: TextStyle(fontSize: 11)),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(right: 5),
                                        child: Wrap(
                                          direction: Axis.vertical,
                                          spacing: 5,
                                          children: [
                                            Text(data.time1,
                                                style: TextStyle(fontSize: 11)),
                                            Text(data.time2,
                                                style: TextStyle(fontSize: 11)),
                                            Text(data.time3,
                                                style: TextStyle(fontSize: 11)),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ))))
                      .toList())),
        ],
      ),
    );
  }
}
