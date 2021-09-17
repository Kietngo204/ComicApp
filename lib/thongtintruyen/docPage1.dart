import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '_docPage1.dart';

class DocPage1 extends StatefulWidget {
  const DocPage1({Key? key}) : super(key: key);

  @override
  _DocPage1State createState() => _DocPage1State();
}

// day a vu
//ok
//đặt tên folder gì kỳ vậy trời ><
class _DocPage1State extends State<DocPage1> {
  //String selected = "";
  int indexCurrent = 0;
  var count;
  //late WebViewPlusController _controller;
  bool isLoading = false;
  //List<DocOne1> one = List<DocOne1>.empty();
  late DocPagea _selected;
  List<DocPagea> lstChapter = DocPagea.lstChapter();
  late int indexNew;
  @override
  void initState() {
    super.initState();
    _selected = lstChapter[indexCurrent];
    print(lstChapter.length);
    isLoading = true;

/* 
    for (int i = 1; i <= 100; i++) {
      this.lstChapter.add('Chapter $i');
    }

    selected = this.lstChapter[indexCurrent]; */
    //if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  /* onChangeSelected(DocPagea value) {
    setState(() {
      /* int indexNew = this.lstChapter.indexOf(value);
      /*  if (indexNew == indexCurrent) {
        //cái này xử lý cho việc nếu nó đang chọn lại cái giá trị đang xuất hiện thì k làm gì hết
        //giờ thì Lỳ thấy hắn bình thường vì chưa có cái gì hết sau Lỳ mới hiểu vì răng Vưũ mần rứa
        return;
      } */
      indexCurrent = indexNew;
      selected = this.lstChapter[indexCurrent]; */

      _selected = value;
    });
  } */
  void nextChapter(String s) {
    if (s == ('-')) {
      indexCurrent--;
    } else {
      indexCurrent++;
    }
    setState(() {
      _selected = lstChapter[indexCurrent];
      indexNew = indexCurrent;
      _controller.loadUrl(_selected.url);
      isLoading = true;
      print('$indexNew');
    });
  }

  var js = "document.getElementsByClassName('header')[0].style.display = 'none';document.getElementsByClassName('footer')[0].style.display = 'none';" +
      "document.getElementsByClassName('reading')[0].childNodes.forEach(function(item){" +
      "if (item.className != 'reading-detail box_doc' && item.className != undefined){item.style.display = 'none';}});";
  final webViewKey = GlobalKey<_DocPage1State>();
  late WebViewController _controller;
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
      body: Container(
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Expanded(
                flex: 1,
                child: Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                      Container(
                        child: ButtonTheme(
                            child: ElevatedButton(
                                onPressed: () {
                                  //_controller.goBack();
                                  setState(() {
                                    nextChapter('-');
                                  });
                                },
                                child: Text('Chap trước'))),
                      ),
                      //dsadsadsada
                      Container(
                        width: 120,
                        height: 50,
                        child: DropdownButton<DocPagea>(
                            value: _selected,
                            onChanged: (value) {
                              setState(() {
                                _selected = value!;
                                isLoading = true;
                                indexNew = this.lstChapter.indexOf(value);
                                // indexCurrent = lstChapter.length;
                                indexCurrent = indexNew;
                              });
                              //_selected = indexNew;
                              print('$indexNew');
                              _controller.loadUrl(_selected.url);
                            },
                            items: lstChapter.skip(0).map((DocPagea value) {
                              return DropdownMenuItem<DocPagea>(
                                  value: value, child: Text(value.chapter));
                            }).toList()),
                      ),
                      Container(
                        child: ButtonTheme(
                            child: ElevatedButton(
                                onPressed: () {
                                  nextChapter('+');
                                },
                                child: Text('Chap sau'))),
                      )
                    ]))),
            Expanded(
              flex: 9,
              child: SizedBox(
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          WebView(
                            //key: webViewKey,
                            initialUrl: _selected.url,
                            onWebViewCreated: (WebViewController controller) {
                              setState(() {});

                              _controller = controller;
                            },
                            onPageFinished: (url) {
                              // _controller.getWebviewPlusHeight().then((double height) {
                              //   print("Height:  " + height.toString());
                              //   setState(() {});
                              // });
                              _controller.evaluateJavascript(js);
                              sleep(Duration(seconds: 1));
                              print('FINISHED');
                              setState(() {
                                isLoading = false;
                              });
                            },

                            javascriptMode: JavascriptMode.unrestricted,
                          ),
                          Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: isLoading
                                  ? Container(
                                      child: Center(
                                          child: CircularProgressIndicator()),
                                      color: Colors.white)
                                  : Container())
                        ],
                      ))),
              /*  decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                ), */
              //           child: Column(
              //             children: [
              //               WebViewPlus(
              //                 javascriptMode: JavascriptMode.unrestricted,
              //                 onWebViewCreated: (controller) {
              //                   controller.loadString(r"""
              //      <html lang="en">
              //       <body>hello world</body>
              //      </html>
              // """);
              //                 },
              //               )
              //             ],
            )
          ])),
    );
  }
}
