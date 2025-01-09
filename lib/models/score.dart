// To parse this JSON data, do
//
//     final score = scoreFromJson(jsonString);

import 'dart:convert';

List<Score> scoreFromJson(String str) =>
    List<Score>.from(json.decode(str).map((x) => Score.fromJson(x)));

String scoreToJson(List<Score> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Score {
  int maBd;
  double heso1;
  double heso3;
  double heso6;
  double tongDiem;
  Giangvien giangvien;
  Sinhvien sinhvien;
  Monhoc monhoc;
  Tinchi tinchi;
  Theloai theloai;
  Hocky hocky;
  Namhoc namhoc;
  dynamic lop;

  Score({
    required this.maBd,
    required this.heso1,
    required this.heso3,
    required this.heso6,
    required this.tongDiem,
    required this.giangvien,
    required this.sinhvien,
    required this.monhoc,
    required this.tinchi,
    required this.theloai,
    required this.hocky,
    required this.namhoc,
    required this.lop,
  });

  factory Score.fromJson(Map<String, dynamic> json) => Score(
        maBd: json["maBD"],
        heso1: json["heso1"],
        heso3: json["heso3"],
        heso6: json["heso6"],
        tongDiem: json["tongDiem"],
        giangvien: Giangvien.fromJson(json["giangvien"]),
        sinhvien: Sinhvien.fromJson(json["sinhvien"]),
        monhoc: Monhoc.fromJson(json["monhoc"]),
        tinchi: Tinchi.fromJson(json["tinchi"]),
        theloai: Theloai.fromJson(json["theloai"]),
        hocky: Hocky.fromJson(json["hocky"]),
        namhoc: Namhoc.fromJson(json["namhoc"]),
        lop: json["lop"],
      );

  Map<String, dynamic> toJson() => {
        "maBD": maBd,
        "heso1": heso1,
        "heso3": heso3,
        "heso6": heso6,
        "tongDiem": tongDiem,
        "giangvien": giangvien.toJson(),
        "sinhvien": sinhvien.toJson(),
        "monhoc": monhoc.toJson(),
        "tinchi": tinchi.toJson(),
        "theloai": theloai.toJson(),
        "hocky": hocky.toJson(),
        "namhoc": namhoc.toJson(),
        "lop": lop,
      };
}

class Hocky {
  String maHk;
  dynamic tenHk;

  Hocky({
    required this.maHk,
    required this.tenHk,
  });

  factory Hocky.fromJson(Map<String, dynamic> json) => Hocky(
        maHk: json["maHK"],
        tenHk: json["tenHK"],
      );

  Map<String, dynamic> toJson() => {
        "maHK": maHk,
        "tenHK": tenHk,
      };
}

class Giangvien {
  String maGv;
  dynamic tenGv;
  dynamic diaChi;
  dynamic sdt;
  dynamic email;

  Giangvien({
    required this.maGv,
    required this.tenGv,
    required this.diaChi,
    required this.sdt,
    required this.email,
  });

  factory Giangvien.fromJson(Map<String, dynamic> json) => Giangvien(
        maGv: json["maGV"],
        tenGv: json["tenGV"],
        diaChi: json["diaChi"],
        sdt: json["sdt"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "maGV": maGv,
        "tenGV": tenGv,
        "diaChi": diaChi,
        "sdt": sdt,
        "email": email,
      };
}

class Monhoc {
  String maMh;
  dynamic tenMh;
  dynamic tinChi;
  dynamic theLoai;

  Monhoc({
    required this.maMh,
    required this.tenMh,
    required this.tinChi,
    required this.theLoai,
  });

  factory Monhoc.fromJson(Map<String, dynamic> json) => Monhoc(
        maMh: json["maMH"],
        tenMh: json["tenMH"],
        tinChi: json["tinChi"],
        theLoai: json["theLoai"],
      );

  Map<String, dynamic> toJson() => {
        "maMH": maMh,
        "tenMH": tenMh,
        "tinChi": tinChi,
        "theLoai": theLoai,
      };
}

class Namhoc {
  String maNh;
  dynamic tenNh;

  Namhoc({
    required this.maNh,
    required this.tenNh,
  });

  factory Namhoc.fromJson(Map<String, dynamic> json) => Namhoc(
        maNh: json["maNH"],
        tenNh: json["tenNH"],
      );

  Map<String, dynamic> toJson() => {
        "maNH": maNh,
        "tenNH": tenNh,
      };
}

class Sinhvien {
  int maSv;
  dynamic tenSv;
  dynamic diaChi;
  dynamic sdt;
  dynamic email;
  dynamic lop;

  Sinhvien({
    required this.maSv,
    required this.tenSv,
    required this.diaChi,
    required this.sdt,
    required this.email,
    required this.lop,
  });

  factory Sinhvien.fromJson(Map<String, dynamic> json) => Sinhvien(
        maSv: json["maSV"],
        tenSv: json["tenSV"],
        diaChi: json["diaChi"],
        sdt: json["sdt"],
        email: json["email"],
        lop: json["lop"],
      );

  Map<String, dynamic> toJson() => {
        "maSV": maSv,
        "tenSV": tenSv,
        "diaChi": diaChi,
        "sdt": sdt,
        "email": email,
        "lop": lop,
      };
}

class Theloai {
  String maTl;
  dynamic tenTl;

  Theloai({
    required this.maTl,
    required this.tenTl,
  });

  factory Theloai.fromJson(Map<String, dynamic> json) => Theloai(
        maTl: json["maTL"],
        tenTl: json["tenTL"],
      );

  Map<String, dynamic> toJson() => {
        "maTL": maTl,
        "tenTL": tenTl,
      };
}

class Tinchi {
  String maTc;
  dynamic soTc;

  Tinchi({
    required this.maTc,
    required this.soTc,
  });

  factory Tinchi.fromJson(Map<String, dynamic> json) => Tinchi(
        maTc: json["maTC"],
        soTc: json["soTC"],
      );

  Map<String, dynamic> toJson() => {
        "maTC": maTc,
        "soTC": soTc,
      };
}
