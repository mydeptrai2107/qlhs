// To parse this JSON data, do
//
//     final namHoc = namHocFromJson(jsonString);

import 'dart:convert';

NamHoc namHocFromJson(String str) => NamHoc.fromJson(json.decode(str));

String namHocToJson(NamHoc data) => json.encode(data.toJson());

class NamHoc {
    String maNh;
    String tenNh;

    NamHoc({
        required this.maNh,
        required this.tenNh,
    });

    factory NamHoc.fromJson(Map<String, dynamic> json) => NamHoc(
        maNh: json["maNH"],
        tenNh: json["tenNH"],
    );

    Map<String, dynamic> toJson() => {
        "maNH": maNh,
        "tenNH": tenNh,
    };
}
