import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Api_topday.dart';

class TopDayRequest {
  static const String url = 'http://comic-api-vunv.somee.com/';
  static Future<TopDay> fetchTopDay() async {
    TopDay _topDay = new TopDay(
        errorCode: 0,
        errorMsg: "Không thể kết nối vào hệ thóng đọc truyện",
        data: []);

    try {
      final response =
          await http.get(Uri.parse(url + 'api/comic/dstruyen/13/1'));
      if (response.statusCode == 200) {
        print(response.body);
        var jsonReponse = jsonDecode(response.body);
        return TopDay.fromJson(jsonReponse);
      }
      return _topDay;
    } catch (e) {
      return _topDay;
    }
  }
}
