// To parse this JSON data, do
//
//     final class = classFromJson(jsonString);

import 'dart:convert';

import 'package:qlhs/models/khoa.dart';

Lop classFromJson(String str) => Lop.fromJson(json.decode(str));

String classToJson(Lop data) => json.encode(data.toJson());

class Lop {
    int maLop;
    String tenLop;
    Khoa khoa;

    Lop({
        required this.maLop,
        required this.tenLop,
        required this.khoa,
    });

    factory Lop.fromJson(Map<String, dynamic> json) => Lop(
        maLop: json["maLop"],
        tenLop: json["tenLop"],
        khoa: Khoa.fromJson(json["khoa"]),
    );

    Map<String, dynamic> toJson() => {
        "maLop": maLop,
        "tenLop": tenLop,
        "khoa": khoa.toJson(),
    };
}
