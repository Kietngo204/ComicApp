class TruyenDeCu {
  late int errorCode;
  late String errorMsg;
  late List<Data> data;

  TruyenDeCu(
      {required this.errorCode, required this.errorMsg, required this.data});

  TruyenDeCu.fromJson(Map<String, dynamic> json) {
    errorCode = json['ErrorCode'];
    errorMsg = json['ErrorMsg'];
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ErrorCode'] = this.errorCode;
    data['ErrorMsg'] = this.errorMsg;
    // ignore: unnecessary_null_comparison
    if (this.data != null) {
      data['Data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  late String urlTruyen;
  late String urlImg;
  late String tenTruyen;
  late String tapTruyen;
  late String thoiGian;

  Data(
      {required this.urlTruyen,
      required this.urlImg,
      required this.tenTruyen,
      required this.tapTruyen,
      required this.thoiGian});

  Data.fromJson(Map<String, dynamic> json) {
    urlTruyen = json['urlTruyen'];
    urlImg = json['urlImg'];
    tenTruyen = json['tenTruyen'];
    tapTruyen = json['tapTruyen'];
    thoiGian = json['thoiGian'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['urlTruyen'] = this.urlTruyen;
    data['urlImg'] = this.urlImg;
    data['tenTruyen'] = this.tenTruyen;
    data['tapTruyen'] = this.tapTruyen;
    data['thoiGian'] = this.thoiGian;
    return data;
  }
}
