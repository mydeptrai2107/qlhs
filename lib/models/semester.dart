// To parse this JSON data, do
//
//     final semester = semesterFromJson(jsonString);

import 'dart:convert';

Semester semesterFromJson(String str) => Semester.fromJson(json.decode(str));

String semesterToJson(Semester data) => json.encode(data.toJson());

class Semester {
    String maHk;
    String tenHk;

    Semester({
        required this.maHk,
        required this.tenHk,
    });

    factory Semester.fromJson(Map<String, dynamic> json) => Semester(
        maHk: json["maHK"],
        tenHk: json["tenHK"],
    );

    Map<String, dynamic> toJson() => {
        "maHK": maHk,
        "tenHK": tenHk,
    };
}
