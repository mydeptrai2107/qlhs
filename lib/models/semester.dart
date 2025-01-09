// To parse this JSON data, do
//
//     final semester = semesterFromJson(jsonString);

import 'dart:convert';

HocKy semesterFromJson(String str) => HocKy.fromJson(json.decode(str));

String semesterToJson(HocKy data) => json.encode(data.toJson());

class HocKy {
  String maHk;
  String tenHk;

  HocKy({
    required this.maHk,
    required this.tenHk,
  });

  factory HocKy.fromJson(Map<String, dynamic> json) => HocKy(
        maHk: json["maHK"],
        tenHk: json["tenHK"],
      );

  Map<String, dynamic> toJson() => {
        "maHK": maHk,
        "tenHK": tenHk,
      };
}
