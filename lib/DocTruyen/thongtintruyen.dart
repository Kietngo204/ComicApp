import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:text_1/listruyen/truyenmoicapnhat/Request_truyenmoicapnhat.dart';
import 'package:text_1/screens/drawer.dart';

import 'package:text_1/thongtintruyen/docPage1.dart';

import 'Api_thongtintruyen.dart';

class Thongtintruyen extends StatefulWidget {
  final String urlTruyen;
  Thongtintruyen({Key? key, required this.urlTruyen}) : super(key: key);
  // final TruyenMoiCapNhatRequest networkRequest = TruyenMoiCapNhatRequest();
  //final Data chitiet1 ;
//  late ListTruyenMoiCapNhat chitiet1;

  @override
  State<Thongtintruyen> createState() => _ThongtintruyenState();
}

DataChiTiet datatruyen = DataChiTiet(
    chapterReading: '',
    chapters: [],
    isFollow: false,
    ngayCapNhat: '',
    noiDung: '',
    tacGia: '',
    tenKhacTruyen: '',
    tenTruyen: '',
    theLoai: '',
    urlImg: '',
    view: '');

//late DataChiTiet datatruyen;

class _ThongtintruyenState extends State<Thongtintruyen> {
  ApiThongTinTruyen chitiet = new ApiThongTinTruyen(
    errorCode: -1001,
    errorMsg: '',
    dataChiTiet: datatruyen,
  );

  String urlChitiet = 'api/comic/detail?urlTruyen=';
  @override
  void initState() {
    super.initState();

    TruyenMoiCapNhatRequest.fetchDataThongTinTruyen(widget.urlTruyen)
        .then((dataFromThongtintruyen) {
      setState(() {
        chitiet = dataFromThongtintruyen;
      });
    });
    setState(() {
      chitiet.dataChiTiet.isFollow = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          leading:
              (ModalRoute.of(context)?.canPop ?? false) ? BackButton() : null,
          backgroundColor: Colors.pink.shade900,
          title: Text('Thông tin truyện'),
        ),
        endDrawer: Drawer1(),
        body: chitiet.errorCode == 0
            ? new SingleChildScrollView(
                child: new Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Column(children: [
                      Text(
                        chitiet.dataChiTiet.tenTruyen,
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(chitiet.dataChiTiet.ngayCapNhat,
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic)),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 250,
                        height: 357,
                        child: Image.network(
                          'http:' + chitiet.dataChiTiet.urlImg,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                        ),
                      )
                    ]),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(children: [
                                    Row(
                                      children: [
                                        Icon(Icons.person,
                                            size: 17, color: Colors.grey),
                                        Text(
                                          'Tác giả',
                                          style: TextStyle(
                                              fontSize: 17, color: Colors.grey),
                                        )
                                      ],
                                    )
                                  ]),
                                  Column(
                                    children: [
                                      Text(chitiet.dataChiTiet.tacGia,
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 17)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(children: [
                                    Row(
                                      children: [
                                        Icon(Icons.rss_feed,
                                            size: 17, color: Colors.grey),
                                        Text(
                                          'Tình trạng',
                                          style: TextStyle(
                                              fontSize: 17, color: Colors.grey),
                                        )
                                      ],
                                    )
                                  ]),
                                  Column(
                                    children: [
                                      Text('Đang tiến hành',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 17)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(children: [
                                      Row(
                                        children: [
                                          Icon(Icons.style,
                                              size: 17, color: Colors.grey),
                                          Text(
                                            'Thể loại',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.grey),
                                          )
                                        ],
                                      )
                                    ]),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(chitiet.dataChiTiet.theLoai,
                                            maxLines: 3,
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 17)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(children: [
                                    Row(
                                      children: [
                                        Icon(Icons.remove_red_eye,
                                            size: 17, color: Colors.grey),
                                        Text(
                                          'Lượt xem',
                                          style: TextStyle(
                                              fontSize: 17, color: Colors.grey),
                                        )
                                      ],
                                    )
                                  ]),
                                  Column(
                                    children: [
                                      Text(chitiet.dataChiTiet.view,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 17)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ])),
                  Container(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonTheme(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: chitiet.dataChiTiet.isFollow
                                          ? Colors.green
                                          : Colors.red),
                                  onPressed: () {
                                    setState(() {
                                      chitiet.dataChiTiet.isFollow =
                                          !chitiet.dataChiTiet.isFollow;
                                    });
                                  },
                                  child: chitiet.dataChiTiet.isFollow
                                      ? Text('Theo dõi')
                                      : Text('Đã theo dõi')),
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 10, right: 5),
                                child: Text(
                                  'Đang cập nhật...',
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                )),
                          ])),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Row(children: [
                            ButtonTheme(
                              buttonColor: Colors.orange,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.green),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DocPage1(
                                                  chapter: chitiet.dataChiTiet
                                                      .chapters[0].chapter,
                                                  url: chitiet.dataChiTiet
                                                      .chapters[0].urlChapter,
                                                  tenTruyen: chitiet
                                                      .dataChiTiet.tenTruyen,
                                                )));
                                  },
                                  child: Text('Đọc truyện')),
                            ),
                          ])),
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 20, top: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.description_outlined,
                            size: 20,
                            color: Colors.blue,
                          ),
                          Text('NỘI DUNG',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.blue))
                        ],
                      )),
                  Padding(padding: EdgeInsets.all(2)),
                  Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: BoxDecoration(color: Colors.blue)),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(chitiet.dataChiTiet.noiDung,
                        style: TextStyle(fontSize: 15)),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 20, top: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.format_list_bulleted,
                            size: 20,
                            color: Colors.blue,
                          ),
                          Text('DANH SÁCH CHƯƠNG',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.blue))
                        ],
                      )),
                  Padding(padding: EdgeInsets.all(2)),
                  Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: BoxDecoration(color: Colors.blue)),
                  Container(
                    padding: EdgeInsets.only(
                        top: 10, left: 30, right: 20, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Số chương',
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        Container(
                            //padding: EdgeInsets.only(right: 17),
                            child: Row(children: [
                          Container(
                            child: Text(
                              'Cập nhật',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(left: 45)),
                          Container(
                            child: Text(
                              'Lượt xem',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ]))
                      ],
                    ),
                  ),
                  Container(
                      //padding: EdgeInsets.only(top: 10, bottom: 10),
                      height: 2,
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: BoxDecoration(color: Colors.blue)),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                      height: 300,
                      child: ListView.builder(
                          //scrollDirection: Axis.vertical,
                          itemCount: chitiet.dataChiTiet.chapters.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DocPage1(
                                              chapter: chitiet.dataChiTiet
                                                  .chapters[index].chapter,
                                              tenTruyen:
                                                  chitiet.dataChiTiet.tenTruyen,
                                              url: chitiet.dataChiTiet
                                                  .chapters[index].urlChapter,
                                            )));
                              },
                              child: Container(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            child: Text(
                                              chitiet.dataChiTiet
                                                  .chapters[index].chapter,
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ),
                                          Container(
                                              //padding: EdgeInsets.only(right: 17),
                                              child: Row(children: [
                                            Container(
                                              child: Text(
                                                chitiet.dataChiTiet
                                                    .chapters[index].capNhat,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 55)),
                                            Container(
                                              child: Text(
                                                chitiet.dataChiTiet
                                                    .chapters[index].view,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                          ]))
                                        ],
                                      ),
                                      Padding(padding: EdgeInsets.all(5)),
                                      Container(
                                          height: 2,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              40,
                                          decoration: DottedDecoration()),
                                    ],
                                  )),
                            );
                          }))
                ],
              ))
            : Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 50,
                  ),
                  Text('Đợi truyện load chút xíu bạn nhé'),
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
                          TruyenMoiCapNhatRequest.fetchDataThongTinTruyen(
                                  widget.urlTruyen)
                              .then((dataThongtintruyen) {
                            chitiet = dataThongtintruyen;
                          });
                        },
                      ))
                ],
              )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => super.widget));
          },
          child: const Icon(Icons.reset_tv),
        ));
  }
}
