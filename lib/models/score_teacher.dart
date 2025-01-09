// To parse this JSON data, do
//
//     final scoreTeacher = scoreTeacherFromJson(jsonString);

import 'dart:convert';

import 'package:qlhs/models/score.dart';

ScoreTeacher scoreTeacherFromJson(String str) => ScoreTeacher.fromJson(json.decode(str));

String scoreTeacherToJson(ScoreTeacher data) => json.encode(data.toJson());

class ScoreTeacher {
    int maBd;
    double heso1;
    double heso3;
    double heso6;
    double tongDiem;
    GiangvienT giangvien;
    Map<String, int> sinhvien;
    MonhocT monhoc;
    Tinchi tinchi;
    TheloaiT theloai;
    HockyT hocky;
    NamhocT namhoc;

    ScoreTeacher({
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
    });

    factory ScoreTeacher.fromJson(Map<String, dynamic> json) => ScoreTeacher(
        maBd: json["maBD"],
        heso1: json["heso1"],
        heso3: json["heso3"],
        heso6: json["heso6"],
        tongDiem: json["tongDiem"],
        giangvien: GiangvienT.fromJson(json["giangvien"]),
        sinhvien: Map.from(json["sinhvien"]).map((k, v) => MapEntry<String, int>(k, v)),
        monhoc: MonhocT.fromJson(json["monhoc"]),
        tinchi: Tinchi.fromJson(json["tinchi"]),
        theloai: TheloaiT.fromJson(json["theloai"]),
        hocky: HockyT.fromJson(json["hocky"]),
        namhoc: NamhocT.fromJson(json["namhoc"]),
    );

    Map<String, dynamic> toJson() => {
        "maBD": maBd,
        "heso1": heso1,
        "heso3": heso3,
        "heso6": heso6,
        "tongDiem": tongDiem,
        "giangvien": giangvien.toJson(),
        "sinhvien": Map.from(sinhvien).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "monhoc": monhoc.toJson(),
        "tinchi": tinchi.toJson(),
        "theloai": theloai.toJson(),
        "hocky": hocky.toJson(),
        "namhoc": namhoc.toJson(),
    };
}

class GiangvienT {
    String maGv;
    int sdt;

    GiangvienT({
        required this.maGv,
        required this.sdt,
    });

    factory GiangvienT.fromJson(Map<String, dynamic> json) => GiangvienT(
        maGv: json["maGV"],
        sdt: json["sdt"],
    );

    Map<String, dynamic> toJson() => {
        "maGV": maGv,
        "sdt": sdt,
    };
}

class HockyT {
    String maHk;

    HockyT({
        required this.maHk,
    });

    factory HockyT.fromJson(Map<String, dynamic> json) => HockyT(
        maHk: json["maHK"],
    );

    Map<String, dynamic> toJson() => {
        "maHK": maHk,
    };
}

class MonhocT {
    String maMh;

    MonhocT({
        required this.maMh,
    });

    factory MonhocT.fromJson(Map<String, dynamic> json) => MonhocT(
        maMh: json["maMH"],
    );

    Map<String, dynamic> toJson() => {
        "maMH": maMh,
    };
}

class NamhocT {
    String maNh;

    NamhocT({
        required this.maNh,
    });

    factory NamhocT.fromJson(Map<String, dynamic> json) => NamhocT(
        maNh: json["maNH"],
    );

    Map<String, dynamic> toJson() => {
        "maNH": maNh,
    };
}

class TheloaiT {
    String maTl;

    TheloaiT({
        required this.maTl,
    });

    factory TheloaiT.fromJson(Map<String, dynamic> json) => TheloaiT(
        maTl: json["maTL"],
    );

    Map<String, dynamic> toJson() => {
        "maTL": maTl,
    };
}

