import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Api_truyenmoicapnhat.dart';

class TruyenMoiCapNhatRequest {
  static const String url = 'http://comic-api-vunv.somee.com/';
  static Future<ListTruyenMoiCapNhat> fetchDataTruyenMoiCapNhat() async {
    ListTruyenMoiCapNhat _truyencapnhat = new ListTruyenMoiCapNhat(
      errorCode: -1234,
      errorMsg: "Không thể kết nối hệ thống đọc truyện",
      data: [],
    );
    try {
      final response = await http.get(Uri.parse(url + 'api/comic/moicapnhat'));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);

        return ListTruyenMoiCapNhat.fromJson(jsonResponse);
      }
      return _truyencapnhat;
    } catch (e) {
      return _truyencapnhat;
    }
  }
}
