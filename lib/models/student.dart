// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';

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
