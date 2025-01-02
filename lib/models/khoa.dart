// To parse this JSON data, do
//
//     final department = departmentFromJson(jsonString);

import 'dart:convert';

Khoa departmentFromJson(String str) => Khoa.fromJson(json.decode(str));

String departmentToJson(Khoa data) => json.encode(data.toJson());

class Khoa {
  String maKh;
  String tenKh;
  String lienheKh;

  Khoa({
    required this.maKh,
    required this.tenKh,
    required this.lienheKh,
  });

  factory Khoa.fromJson(Map<String, dynamic> json) => Khoa(
        maKh: json["maKH"],
        tenKh: json["tenKH"],
        lienheKh: json["lienheKH"],
      );

  Map<String, dynamic> toJson() => {
        "maKH": maKh,
        "tenKH": tenKh,
        "lienheKH": lienheKh,
      };
}
