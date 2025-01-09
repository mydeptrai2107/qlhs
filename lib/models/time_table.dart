// To parse this JSON data, do
//
//     final timetable = timetableFromJson(jsonString);

import 'dart:convert';

TimeTable timetableFromJson(String str) => TimeTable.fromJson(json.decode(str));

String timetableToJson(TimeTable data) => json.encode(data.toJson());

class TimeTable {
  int maTkb;
  int maLop;
  String maMh;
  String maGv;
  String ngayHoc;
  String gioBatDau;
  String gioKetThuc;
  String phongHoc;

  TimeTable({
    required this.maTkb,
    required this.maLop,
    required this.maMh,
    required this.maGv,
    required this.ngayHoc,
    required this.gioBatDau,
    required this.gioKetThuc,
    required this.phongHoc,
  });

  factory TimeTable.fromJson(Map<String, dynamic> json) => TimeTable(
        maTkb: json["maTKB"],
        maLop: json["maLop"],
        maMh: json["maMH"],
        maGv: json["maGV"],
        ngayHoc: json["ngayHoc"],
        gioBatDau: json["gioBatDau"],
        gioKetThuc: json["gioKetThuc"],
        phongHoc: json["phongHoc"],
      );

  Map<String, dynamic> toJson() => {
        "maTKB": maTkb,
        "maLop": maLop,
        "maMH": maMh,
        "maGV": maGv,
        "ngayHoc": ngayHoc,
        "gioBatDau": gioBatDau,
        "gioKetThuc": gioKetThuc,
        "phongHoc": phongHoc,
      };
}
