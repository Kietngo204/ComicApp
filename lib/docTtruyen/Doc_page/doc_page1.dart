import 'package:flutter/material.dart';

import 'package:text_1/docTtruyen/Doc_page/droplist.dart/_docpage1.dart';
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
  //String selected = "";
  int indexCurrent = 0;
  //late WebViewPlusController _controller;
  bool isLoading = false;
  //List<DocOne1> one = List<DocOne1>.empty();
  late DocPagea _selected;
  List<DocPagea> lstChapter = DocPagea.lstChapter();

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
                                  lstChapter[indexCurrent--];
                                  //_controller.goBack();
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
                                print('URL_TRUYEN: ' + _selected.url);
                              });
                              _controller.loadUrl(_selected.url);
                            },
                            items: lstChapter
                                .map((DocPagea value) =>
                                    DropdownMenuItem<DocPagea>(
                                        value: value,
                                        child: Text(value.chapter)))
                                .toList()),
                      ),
                      Container(
                        child: ButtonTheme(
                            child: ElevatedButton(
                                onPressed: () {
                                  lstChapter[indexCurrent++];
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
                            // key: webViewKey,
                            initialUrl: _selected.url,
                            onWebViewCreated: (WebViewController controller) {
                              _controller = controller;
                            },
                            onPageFinished: (url) {
                              // _controller.getWebviewPlusHeight().then((double height) {
                              //   print("Height:  " + height.toString());
                              //   setState(() {});
                              // });
                              print('FINISHED');
                              setState(() {
                                isLoading = false;
                              });
                              _controller.evaluateJavascript(js);
                            },

                            javascriptMode: JavascriptMode.unrestricted,
                          ),
                          Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: isLoading
                                  ? Center(child: CircularProgressIndicator())
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

  void reloadWebView() {
    _controller.reload();
  }
}
