class TopWeek {
  late int errorCode;
  late String errorMsg;
  late List<Data> data;

  TopWeek(
      {required this.errorCode, required this.errorMsg, required this.data});

  TopWeek.fromJson(Map<String, dynamic> json) {
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
    if (this.data != null) {
      data['Data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  late String view;
  late String heart;
  late String comment;
  late List<Details> details;
  late String urlTruyen;
  late String urlImg;
  late String tenTruyen;
  Null tapTruyen;
  Null thoiGian;

  Data(
      {required this.view,
      required this.heart,
      required this.comment,
      required this.details,
      required this.urlTruyen,
      required this.urlImg,
      required this.tenTruyen,
      this.tapTruyen,
      this.thoiGian});

  Data.fromJson(Map<String, dynamic> json) {
    view = json['view'];
    heart = json['heart'];
    comment = json['comment'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details.add(new Details.fromJson(v));
      });
    }
    urlTruyen = json['urlTruyen'];
    urlImg = json['urlImg'];
    tenTruyen = json['tenTruyen'];
    tapTruyen = json['tapTruyen'];
    thoiGian = json['thoiGian'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['view'] = this.view;
    data['heart'] = this.heart;
    data['comment'] = this.comment;
    if (this.details != null) {
      data['details'] = this.details.map((v) => v.toJson()).toList();
    }
    data['urlTruyen'] = this.urlTruyen;
    data['urlImg'] = this.urlImg;
    data['tenTruyen'] = this.tenTruyen;
    data['tapTruyen'] = this.tapTruyen;
    data['thoiGian'] = this.thoiGian;
    return data;
  }
}

class Details {
  late String chapter;
  late String timer;

  Details({required this.chapter, required this.timer});

  Details.fromJson(Map<String, dynamic> json) {
    chapter = json['chapter'];
    timer = json['timer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chapter'] = this.chapter;
    data['timer'] = this.timer;
    return data;
  }
}
