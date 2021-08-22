import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:text_1/doc%20truyen/Doc_page/doc_page1.dart';

class Page1 extends StatefulWidget {
  @override
  _PaGe1 createState() => _PaGe1();
}

class _PaGe1 extends State {
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
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            child: Column(children: [
              Text('Anh Hùng OnePunch', style: TextStyle(fontSize: 30)),
              Text('[Cập nhật lúc: 16:48 11/08/2021]',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic)),
              Container(
                width: 250,
                height: 357,
                child: Image.asset(
                  'acssets/images/anh-hung-onepunch.jpg',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
              )
            ]),
          ),
          Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                Container(
                    child:
                        Wrap(spacing: 10, direction: Axis.vertical, children: [
                  Row(
                    children: [
                      Icon(Icons.person, size: 17, color: Colors.grey),
                      Text(
                        'Tác giả',
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.rss_feed, size: 17, color: Colors.grey),
                      Text(
                        'Tình trạng',
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.style, size: 17, color: Colors.grey),
                      Text(
                        'Thể loại',
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.remove_red_eye, size: 17, color: Colors.grey),
                      Text(
                        'Lượt xem',
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      )
                    ],
                  ),
                ])),
                Container(
                  child: Wrap(spacing: 10, direction: Axis.vertical, children: [
                    Row(children: [
                      InkWell(
                        child: Text('ONE',
                            style: TextStyle(color: Colors.blue, fontSize: 17)),
                        onTap: () {
                          print('one');
                        },
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Text('-',
                            style: TextStyle(color: Colors.grey, fontSize: 17)),
                      ),
                      InkWell(
                        child: Text('MURATA Yuusuke',
                            style: TextStyle(color: Colors.blue, fontSize: 17)),
                        onTap: () {
                          print('Murata');
                        },
                      ),
                    ]),
                    Text('Đang tiến hành',
                        style: TextStyle(color: Colors.grey, fontSize: 17)),
                    Row(children: [
                      InkWell(
                        child: Text('Action',
                            style: TextStyle(color: Colors.blue, fontSize: 17)),
                        onTap: () {
                          print('action');
                        },
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Text('-',
                            style: TextStyle(color: Colors.grey, fontSize: 17)),
                      ),
                      InkWell(
                        child: Text('Comedy',
                            style: TextStyle(color: Colors.blue, fontSize: 17)),
                        onTap: () {
                          print('comedy');
                        },
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Text('-',
                            style: TextStyle(color: Colors.grey, fontSize: 17)),
                      ),
                      InkWell(
                        child: Text('Manga',
                            style: TextStyle(color: Colors.blue, fontSize: 17)),
                        onTap: () {
                          print('manga');
                        },
                      ),
                    ]),
                    Text('72.956.021',
                        style: TextStyle(color: Colors.grey, fontSize: 17)),
                  ]),
                )
              ])),
          Container(
              padding: EdgeInsets.only(left: 20, right: 15),
              child: Row(children: [
                ButtonTheme(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      onPressed: () {},
                      child: Text('Theo dõi')),
                ),
                Container(
                    padding: EdgeInsets.only(left: 10, right: 5),
                    child: Text(
                      '108.471',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    )),
                Container(
                    child: Text(
                  'Người Đã Theo Dõi',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                ))
              ])),
          Container(
              padding: EdgeInsets.only(left: 20),
              child: Row(children: [
                ButtonTheme(
                  buttonColor: Colors.orange,
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.orange[300]),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DocPage1()));
                      },
                      child: Text('Đọc từ đầu')),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ButtonTheme(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.orange[300]),
                        onPressed: () {},
                        child: Text('Đọc mới nhất')),
                  ),
                ),
                ButtonTheme(
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.orange[300]),
                      onPressed: () {},
                      child: Text('Đọc tiếp')),
                ),
              ])),
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
                      style: TextStyle(fontSize: 20, color: Colors.blue))
                ],
              )),
          Padding(padding: EdgeInsets.all(2)),
          Container(
              height: 2,
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(color: Colors.blue)),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Text(
                'Một Manga thể loại siêu anh hùng với đặc trưng phồng tôm đấm phát chết luôn... và mang đậm tính chất troll của tác giả.',
                style: TextStyle(fontSize: 15)),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
                'Onepunch-man là câu chuyện của 1 chàng thanh niên 25 tuổi, đang là một nhân viên văn phòng điển trai nghiêm túc và tất nhiên là ế. Không hiểu vì biến cố gì mà tự nhiên lông tóc trên người của anh trụi lủi, sau đó anh mang trong mình khả năng siêu đặc biệt "Đấm phát chết luôn" nhằm bảo vệ trái đất và thành phố nơi anh sinh sống khỏi các sinh vật ngoài không gian (nhưng phá hoại cũng không kém).',
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
                      style: TextStyle(fontSize: 20, color: Colors.blue))
                ],
              )),
          Padding(padding: EdgeInsets.all(2)),
          Container(
              height: 2,
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(color: Colors.blue)),
          Container(
            padding: EdgeInsets.only(top: 10, left: 30, right: 20),
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
          SizedBox(
              height: 300,
              child: ListView.builder(
                  //scrollDirection: Axis.vertical,
                  itemCount: 100,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child: Text(
                                    'Chapter $index',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                Container(
                                    //padding: EdgeInsets.only(right: 17),
                                    child: Row(children: [
                                  Container(
                                    child: Text(
                                      '$index Phút trước',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 55)),
                                  Container(
                                    child: Text(
                                      '$index.000',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    ),
                                  ),
                                ]))
                              ],
                            ),
                            Padding(padding: EdgeInsets.all(5)),
                            Container(
                                height: 2,
                                width: MediaQuery.of(context).size.width - 40,
                                decoration: DottedDecoration()),
                          ],
                        ));
                  }))
        ],
      )),
    );
  }
}
