import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Api_topweek.dart';

class TopWeekRequest {
  static const String url = 'http://comic-api-vunv.somee.com/';
  static Future<TopWeek> fetchTopWeek() async {
    TopWeek _topweek = new TopWeek(
        errorCode: 0,
        errorMsg: "Không thể kết nối vào hệ thống đọc truyện",
        data: []);
    try {
      final response =
          await http.get(Uri.parse(url + 'api/comic/dstruyen/12/1'));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        return TopWeek.fromJson(jsonResponse);
      }
      return _topweek;
    } catch (e) {
      return _topweek;
    }
  }
}
