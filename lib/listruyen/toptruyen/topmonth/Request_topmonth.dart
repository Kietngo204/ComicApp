import 'dart:convert';

import 'package:text_1/listruyen/toptruyen/topmonth/Api_topmonth.dart';
import 'package:http/http.dart' as http;

class TopMonthRequest {
  static const String url = 'http://comic-api-vunv.somee.com/';
  static Future<TopMonth> fetchTopMonth() async {
    TopMonth _topmonth = new TopMonth(
        errorCode: 0,
        errorMsg: 'Không thể kết nối vào hệ thống đọc truyện',
        data: []);
    try {
      final response =
          await http.get(Uri.parse(url + 'api/comic/dstruyen/11/1'));
      if (response.statusCode == 200) {
        var jsonReponse = jsonDecode(response.body);
        return TopMonth.fromJson(jsonReponse);
      }
      return _topmonth;
    } catch (e) {
      return _topmonth;
    }
  }
}
