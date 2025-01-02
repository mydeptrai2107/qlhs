// To parse this JSON data, do
//
//     final subject = subjectFromJson(jsonString);

import 'dart:convert';

import 'package:qlhs/models/score.dart';

Subject subjectFromJson(String str) => Subject.fromJson(json.decode(str));

String subjectToJson(Subject data) => json.encode(data.toJson());

class Subject {
    String maMh;
    String tenMh;
    Tinchi tinChi;
    Theloai theLoai;

    Subject({
        required this.maMh,
        required this.tenMh,
        required this.tinChi,
        required this.theLoai,
    });

    factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        maMh: json["maMH"],
        tenMh: json["tenMH"],
        tinChi: Tinchi.fromJson(json["tinChi"]),
        theLoai: Theloai.fromJson(json["theLoai"]),
    );

    Map<String, dynamic> toJson() => {
        "maMH": maMh,
        "tenMH": tenMh,
        "tinChi": tinChi.toJson(),
        "theLoai": theLoai.toJson(),
    };
}
