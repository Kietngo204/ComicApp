class ApiThongTinTruyen {
  late int errorCode;
  late String errorMsg;
  late DataChiTiet dataChiTiet;

  ApiThongTinTruyen(
      {required this.errorCode,
      required this.errorMsg,
      required this.dataChiTiet});

  ApiThongTinTruyen.fromJson(Map<String, dynamic> json) {
    errorCode = json['ErrorCode'];
    errorMsg = json['ErrorMsg'];
    dataChiTiet =
        (json['Data'] != null ? new DataChiTiet.fromJson(json['Data']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ErrorCode'] = this.errorCode;
    data['ErrorMsg'] = this.errorMsg;
    if (this.dataChiTiet != null) {
      data['Data'] = this.dataChiTiet.toJson();
    }
    return data;
  }
}

class DataChiTiet {
  late String tenTruyen;
  late String ngayCapNhat;
  late String urlImg;
  late String tenKhacTruyen;
  late String tacGia;
  late String theLoai;
  late String view;
  late String noiDung;
  late bool isFollow;
  late List<Chapters> chapters;
  late String chapterReading;

  DataChiTiet(
      {required this.tenTruyen,
      required this.ngayCapNhat,
      required this.urlImg,
      required this.tenKhacTruyen,
      required this.tacGia,
      required this.theLoai,
      required this.view,
      required this.noiDung,
      required this.isFollow,
      required this.chapters,
      required this.chapterReading});

  DataChiTiet.fromJson(Map<String, dynamic> json) {
    tenTruyen = json['tenTruyen'];
    ngayCapNhat = json['ngayCapNhat'];
    urlImg = json['urlImg'];
    tenKhacTruyen = json['tenKhacTruyen'];
    tacGia = json['tacGia'];
    theLoai = json['theLoai'];
    view = json['view'];
    noiDung = json['noiDung'];
    isFollow = json['isFollow'];
    if (json['chapters'] != null) {
      chapters = <Chapters>[];
      json['chapters'].forEach((v) {
        chapters.add(new Chapters.fromJson(v));
      });
    }
    chapterReading = json['chapterReading'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tenTruyen'] = this.tenTruyen;
    data['ngayCapNhat'] = this.ngayCapNhat;
    data['urlImg'] = this.urlImg;
    data['tenKhacTruyen'] = this.tenKhacTruyen;
    data['tacGia'] = this.tacGia;
    data['theLoai'] = this.theLoai;
    data['view'] = this.view;
    data['noiDung'] = this.noiDung;
    data['isFollow'] = this.isFollow;
    if (this.chapters != null) {
      data['chapters'] = this.chapters.map((v) => v.toJson()).toList();
    }
    data['chapterReading'] = this.chapterReading;
    return data;
  }
}

class Chapters {
  late String chapter;
  late String capNhat;
  late String view;
  late String urlChapter;

  Chapters(
      {required this.chapter,
      required this.capNhat,
      required this.view,
      required this.urlChapter});

  Chapters.fromJson(Map<String, dynamic> json) {
    chapter = json['chapter'];
    capNhat = json['capNhat'];
    view = json['view'];
    urlChapter = json['urlChapter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chapter'] = this.chapter;
    data['capNhat'] = this.capNhat;
    data['view'] = this.view;
    data['urlChapter'] = this.urlChapter;
    return data;
  }
}
