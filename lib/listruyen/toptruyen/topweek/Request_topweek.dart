import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'Api_topweek.dart';
import 'package:unique_identifier/unique_identifier.dart';

class TopWeekRequest {
  static const String url = 'http://comic-api-vunv.somee.com/';

  static Future<TopWeek> fetchTopWeek() async {
    String imei = (await UniqueIdentifier.serial)!;
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: 'Bear $imei '
    };

    TopWeek _topweek = new TopWeek(
        errorCode: -1101,
        errorMsg: "Không thể kết nối vào hệ thống đọc truyện",
        data: []);
    try {
      final response = await http.get(
        Uri.parse(url + 'api/comic/dstruyen/12/1'),
        headers: headers,
      );
      if (response.statusCode == 200) {
        print(response.headers);
        print(imei);
        var jsonResponse = jsonDecode(response.body);
        return TopWeek.fromJson(jsonResponse);
      }
      return _topweek;
    } catch (e) {
      return _topweek;
    }
  }
}
