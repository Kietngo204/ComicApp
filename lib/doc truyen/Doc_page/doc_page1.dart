import 'dart:io';

import 'package:flutter/material.dart';
import 'package:text_1/doc%20truyen/Doc_page/droplist.dart/listdocpage1.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DocPage1 extends StatefulWidget {
  const DocPage1({Key? key}) : super(key: key);

  @override
  _DocPage1State createState() => _DocPage1State();
}

// day a vu
//ok
//đặt tên folder gì kỳ vậy trời ><
class _DocPage1State extends State<DocPage1> {
  String selected = "";
  int indexCurrent = 0;
  //List<DocOne1> one = List<DocOne1>.empty();

  List<String> lstChapter = [];

  @override
  void initState() {
    super.initState();
    print('HUHU');
    for (int i = 1; i <= 100; i++) {
      print('Sao lai khong vao day ha');
      this.lstChapter.add('Chapter $i');
      print(this.lstChapter.length);
    }
    selected = this.lstChapter[indexCurrent];
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  void onChangeSelected(String value) {
    setState(() {
      int indexNew = this.lstChapter.indexOf(value);
      if (indexNew == indexCurrent) {
        //cái này xử lý cho việc nếu nó đang chọn lại cái giá trị đang xuất hiện thì k làm gì hết
        //giờ thì Lỳ thấy hắn bình thường vì chưa có cái gì hết sau Lỳ mới hiểu vì răng Vũ mần rứa
        return;
      }
      indexCurrent = indexNew;
      selected = this.lstChapter[indexCurrent];
    });
  }

  late WebViewPlusController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade900,
        title: Text('Anh Hùng OnePunch'),
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
          child: Container(
              child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
            Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                child: ButtonTheme(
                    child: ElevatedButton(
                        onPressed: () {}, child: Text('Chap trước'))),
              ),
              Container(
                width: 120,
                height: 50,
                child: DropdownButton(
                    value: selected,
                    onChanged: (String? value) {
                      onChangeSelected(value!);
                    },
                    items: this
                        .lstChapter
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList()),
              ),
              Container(
                child: ButtonTheme(
                    child: ElevatedButton(
                        onPressed: () {}, child: Text('Chap sau'))),
              )
            ])),
            //hihihihihfidhfihdfihdifhdihfidf
            SizedBox(
                // width: MediaQuery.of(context).size.width - 40,
                height: 1000,
                /*  decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                ), */
                child: Column(
                  children: [
                    WebViewPlus(
                      javascriptMode: JavascriptMode.unrestricted,
                      onWebViewCreated: (controller) {
                        controller.loadString(r"""
           <html lang="en">
            <body>hello world</body>
           </html>
      """);
                      },
                    )
                  ],
                ))
          ]))),
    );
  }
}
