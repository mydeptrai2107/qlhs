// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';

import 'package:qlhs/models/class.dart';

Student studentFromJson(String str) => Student.fromJson(json.decode(str));

String studentToJson(Student data) => json.encode(data.toJson());

class Student {
    int maSv;
    String tenSv;
    String diaChi;
    int sdt;
    String email;
    Lop lop;

    Student({
        required this.maSv,
        required this.tenSv,
        required this.diaChi,
        required this.sdt,
        required this.email,
        required this.lop,
    });

    factory Student.fromJson(Map<String, dynamic> json) => Student(
        maSv: json["maSV"],
        tenSv: json["tenSV"],
        diaChi: json["diaChi"],
        sdt: json["sdt"],
        email: json["email"],
        lop: Lop.fromJson(json["lop"]),
    );

    Map<String, dynamic> toJson() => {
        "maSV": maSv,
        "tenSV": tenSv,
        "diaChi": diaChi,
        "sdt": sdt,
        "email": email,
        "lop": lop.toJson(),
    };
}

