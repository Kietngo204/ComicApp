import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:text_1/listruyen/truyendecu/Api_truyendecu.dart';

class TruyenDeCuRequest {
  static const String url = 'http://comic-api-vunv.somee.com/';

  static Future<TruyenDeCu> fetchDataDeCu() async {
    TruyenDeCu _truyenDeCu = new TruyenDeCu(
        errorCode: -1001,
        errorMsg: 'Không kết nối được hệ thống đọc truyện',
        data: []);
    try {
      final response = await http.get(Uri.parse(url + 'api/comic/decu'));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        return TruyenDeCu.fromJson(jsonResponse);
      }
      return _truyenDeCu;
    } catch (e) {
      return _truyenDeCu;
    }
  }
}
