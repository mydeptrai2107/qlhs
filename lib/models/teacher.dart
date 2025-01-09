// To parse this JSON data, do
//
//     final teacher = teacherFromJson(jsonString);

import 'dart:convert';

Teacher teacherFromJson(String str) => Teacher.fromJson(json.decode(str));

String teacherToJson(Teacher data) => json.encode(data.toJson());

class Teacher {
  String maGv;
  String tenGv;
  String diaChi;
  int sdt;
  String email;

  Teacher({
    required this.maGv,
    required this.tenGv,
    required this.diaChi,
    required this.sdt,
    required this.email,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
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
