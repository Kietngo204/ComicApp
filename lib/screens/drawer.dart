import 'package:flutter/material.dart';

class Drawer1 extends StatefulWidget {
  const Drawer1({Key? key}) : super(key: key);

  @override
  _Drawer1State createState() => _Drawer1State();
}

class _Drawer1State extends State<Drawer1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor:
              Colors.black, //This will change the drawer background to blue.
          //other styles
        ),
        child: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            // padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  curve: Curves.fastOutSlowIn,
                  decoration: BoxDecoration(
                    color: Colors.pink.shade900,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'acssets/images/logo-nettruyen.png',
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 40,
                        child: TextField(
                            maxLength: null,
                            autofocus: true,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Tìm kiếm truyện...',
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 13),
                              helperMaxLines: 3,
                              hintText: 'Nhập truyện bạn muốn tìm kiếm',
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 11),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  // width: 100,
                                  color: Colors.white,
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(5.0)),
                              ),
                            )),
                      ),
                      SizedBox(height: 5),
                      ButtonTheme(
                          buttonColor: Colors.white,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Tìm truyện',
                                style: TextStyle(color: Colors.white),
                              )))
                    ],
                  )),
              ListTile(
                title: const Text('HOT', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('THEO DÕI',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('LỊCH SỬ',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('THỂ LOẠI',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('XẾP HẠNG',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('TÌM TRUYỆN',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('CON GÁI',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('CON TRAI',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    const Text('GROUP', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    child: const Text('ĐĂNG NHẬP',
                        style: TextStyle(color: Colors.white)),
                  ),
                  const Text('/', style: TextStyle(color: Colors.white)),
                  InkWell(
                    child: const Text('ĐĂNG KÍ',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.only(top: 5),
                  height: 1,
                  decoration: BoxDecoration(color: Colors.white)),
              Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Code by Kiệt Ngô',
                    style: TextStyle(color: Colors.white),
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
