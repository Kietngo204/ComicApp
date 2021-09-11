import 'package:flutter/cupertino.dart';
import 'package:text_1/listruyen/truyendecu/truyen_de_cu.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class DanhSachDeCu extends StatefulWidget {
  @override
  TruyenDeCuState createState() => TruyenDeCuState();
}

class TruyenDeCuState extends State {
  var dataTruyen = dataTruyenDeCu;
  int indexCurrent = 0;
  var _conTroller = ScrollController();

  void scrollNextItem(String ly) {
    if (ly == '-') {
      indexCurrent -= 1;
    } else {
      indexCurrent += 1;
    }

    if (indexCurrent >= (dataTruyen.length - 1) || indexCurrent <= 0) {
      indexCurrent = 0;
      print('abc');
    }

    _conTroller.animateTo(
        ((MediaQuery.of(context).size.width) * 1 / 2) * indexCurrent,
        duration: Duration(seconds: 1),
        curve: Curves.easeInToLinear);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              const Text(
                'TRUYỆN ĐỀ CỬ ',
                style: TextStyle(color: Colors.blue, fontSize: 25),
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              height: 200,
              child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: (MediaQuery.of(context).size.width - 20) * 0.04,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  //padding: const EdgeInsets.all(8),
                  controller: _conTroller,
                  itemCount: dataTruyen.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      width:
                          (MediaQuery.of(context).size.width - 20) * 0.96 / 2,
                      child: Stack(children: <Widget>[
                        Image.network(dataTruyen[index].url,
                            fit: BoxFit.cover,
                            width: (MediaQuery.of(context).size.width - 20) *
                                0.96),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 30),
                          child: Marquee(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              scrollAxis: Axis.horizontal,
                              blankSpace: 20.0,
                              pauseAfterRound: Duration(seconds: 1),
                              decelerationDuration: Duration(milliseconds: 500),
                              text: dataTruyen[index].name,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white)),
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            alignment: Alignment.bottomLeft,
                            child: Text(dataTruyen[index].chapter,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white))),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.only(right: 5),
                                alignment: Alignment.bottomRight,
                                child: Icon(Icons.access_alarm,
                                    size: 12, color: Colors.white)),
                            Container(
                                padding: EdgeInsets.only(right: 10),
                                alignment: Alignment.bottomRight,
                                child: Text(dataTruyen[index].time,
                                    /* DateFormat.Hm()
                                            .add_Md()
                                            .format(dataTruyen[index].time), */
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white))),
                          ],
                        ),
                      ]),
                    );
                  }),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(top: 60, right: 10),
              child: GestureDetector(
                onTap: () {
                  scrollNextItem('+');
                },
                child: Container(
                  width: 60,
                  height: 60,
                  child: Center(
                    child: Text('>'),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.deepOrange[50]!.withOpacity(0.6)),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 60, left: 10),
              child: GestureDetector(
                onTap: () {
                  // _conTroller.animateTo(
                  //     (MediaQuery.of(context).size.width) * 0.01,
                  //     duration: Duration(seconds: 1),
                  //     curve: Curves.easeInOut);
                  scrollNextItem('-');
                },
                child: Container(
                  width: 60,
                  height: 60,
                  child: Center(
                    child: Text('<'),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.deepOrange[50]!.withOpacity(0.6)),
                ),
              ),
            )
          ],
        )
      ],
    ));
  }
}
