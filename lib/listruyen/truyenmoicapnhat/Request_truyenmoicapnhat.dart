import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:text_1/DocTruyen/Api_thongtintruyen.dart';
import 'package:unique_identifier/unique_identifier.dart';

import 'Api_truyenmoicapnhat.dart';

const String url = 'http://comic-api-vunv.somee.com/';
String urlChitiet = 'api/comic/detail?urlTruyen=';

class TruyenMoiCapNhatRequest {
  static Future<ListTruyenMoiCapNhat> fetchDataTruyenMoiCapNhat() async {
    String imei = (await UniqueIdentifier.serial)!;

    Map<String, String> headers = {
      // HttpHeaders.contentTypeHeader: "api/comic/detail?urlTruyen",
      HttpHeaders.authorizationHeader: 'Bearer $imei '
    };
    ListTruyenMoiCapNhat _truyencapnhat = new ListTruyenMoiCapNhat(
      errorCode: -1001,
      errorMsg: "Không thể kết nối hệ thống đọc truyện",
      data: [],
    );
    try {
      final response = await http.get(Uri.parse('$url/api/comic/moicapnhat'),
          headers: headers);
      if (response.statusCode == 200) {
        // print(imei);
        var jsonResponse = json.decode(response.body);
        print(response.headers);
        // print(response.body);
        return ListTruyenMoiCapNhat.fromJson(jsonResponse);
      }
      return _truyencapnhat;
    } catch (e) {
      return _truyencapnhat;
    }
  }

  static Future<ApiThongTinTruyen> fetchDataThongTinTruyen(apiUrl) async {
    DataChiTiet datatruyen = DataChiTiet(
        chapterReading: '',
        chapters: [],
        isFollow: false,
        ngayCapNhat: '',
        noiDung: '',
        tacGia: '',
        tenKhacTruyen: '',
        tenTruyen: '',
        theLoai: '',
        urlImg: '',
        view: '');
    String imei = (await UniqueIdentifier.serial)!;
    //String url1 = '';
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Imei": imei
    };
    ApiThongTinTruyen _thongtintruyen = new ApiThongTinTruyen(
      errorCode: -1001,
      errorMsg: 'Không thể kết nối đến hệ thống đọc truyện',
      dataChiTiet: datatruyen,
    );
    try {
      final response = await http.get(Uri.parse(url + urlChitiet + apiUrl),
          headers: headers);
      if (response.statusCode == 200) {
        print(imei);
        var jsonResponse = json.decode(response.body);
        print(response.headers);
        print(response.body);

        return ApiThongTinTruyen.fromJson(jsonResponse);
      }
      return _thongtintruyen;
    } catch (e) {
      return _thongtintruyen;
    }
  }
}
