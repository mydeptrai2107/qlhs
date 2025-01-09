// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:math';

import 'package:qlhs/models/class.dart';
import 'package:qlhs/models/khoa.dart';
import 'package:qlhs/models/namhoc.dart';
import 'package:qlhs/models/score.dart';
import 'package:qlhs/models/score_teacher.dart';
import 'package:qlhs/models/semester.dart';
import 'package:qlhs/models/student.dart';
import 'package:qlhs/models/subject.dart';
import 'package:qlhs/models/teacher.dart';
import 'package:qlhs/models/time_table.dart';
import 'package:qlhs/repository/client.dart';

class RepositoryAdmin {
  final client = Client();

  Future<List<Student>> getAllStudent() async {
    try {
      final response = await client.get('admin_sinhvien');
      if (response.statusCode == 200) {
        List<Student> list = [];
        Iterable it = jsonDecode(response.body)['sinhVienList'];
        for (int i = 0; i < it.length; i++) {
          list.add(Student.fromJson(it.elementAt(i)));
        }
        return list;
      } else {
        throw Exception('Lỗi');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Teacher>> getAllTeacher() async {
    try {
      final response = await client.get('admin_giang_vien');
      if (response.statusCode == 200) {
        List<Teacher> list = [];
        Iterable it = jsonDecode(response.body);
        for (int i = 0; i < it.length; i++) {
          list.add(Teacher.fromJson(it.elementAt(i)));
        }
        return list;
      } else {
        throw Exception('Lỗi');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> addGiangVien(
    String name,
    String address,
    String phoneNumber,
    String email,
  ) async {
    try {
      final response = await client.post(
        'admin_giang_vien',
        {
          "maGV": generateRandomString(10),
          "tenGV": name,
          "diaChi": address,
          "sdt": int.parse(phoneNumber),
          "email": email,
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateGiangVien(
    String mGV,
    String name,
    String address,
    String phoneNumber,
    String email,
  ) async {
    try {
      final response = await client.post(
        'admin_giangvienupdate',
        {
          "maGV": mGV,
          "tenGV": name,
          "diaChi": address,
          "sdt": int.parse(phoneNumber),
          "email": email,
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteGiangVien(
    String maGV,
  ) async {
    try {
      final response = await client.post(
        'admin_giangviendelete',
        {
          "maGV": maGV,
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteStudent(int maHS) async {
    try {
      final response = await client.post(
        'admin_sinhviendelete',
        {
          "masv": maHS,
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> addStudent(
    String name,
    String address,
    String phoneNumber,
    String email,
    int malop,
  ) async {
    try {
      final Random random = Random();
      final response = await client.post(
        'admin_sinhvien',
        {
          "masv": random.nextInt(1000000000),
          "tensv": name,
          "diachi": address,
          "sdt": int.parse(phoneNumber),
          "email": email,
          "malop": malop
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateStudent(
    int masv,
    String name,
    String address,
    String phoneNumber,
    String email,
    int maLop,
  ) async {
    try {
      final response = await client.post(
        'admin_sinhvienupdate',
        {
          "masv": masv,
          "tensv": name,
          "diachi": address,
          "sdt": int.parse(phoneNumber),
          "email": email,
          "malop": maLop
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  String generateRandomString(int length) {
    const String chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final Random random = Random();

    return List.generate(length, (index) => chars[random.nextInt(chars.length)])
        .join();
  }

  Future<List<ScoreTeacher>> getScore() async {
    try {
      final response = await client.get('admin_diem');
      if (response.statusCode == 200) {
        Iterable data = jsonDecode(response.body);
        List<ScoreTeacher> list =
            data.map((e) => ScoreTeacher.fromJson(e)).toList();
        return list;
      } else {
        throw Exception('Lỗi');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future addScore(
    String maMH,
    String maHK,
    String maNH,
    String maGV,
    String maTC,
    String maTL,
    int maSV,
    double hs1,
    double hs3,
    double hs6,
  ) async {
    try {
      await client.post(
        'admin_diem',
        {
          "maMonHoc": maMH,
          "maHocKy": maHK,
          "maNamhoc": maNH,
          "maGiangVien": maGV,
          "maTinChi": maTC,
          "maTheLoai": maTL,
          "maSinhVien": maSV,
          "heso1": hs1,
          "heso3": hs3,
          "heso6": hs6,
          "tongDiem": hs1 * 0.1 + hs3 * 0.3 + hs6 * 0.6
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future updateScore(
    int maDiem,
    String maMH,
    String maHK,
    String maNH,
    String maGV,
    String maTC,
    String maTL,
    int maSV,
    double hs1,
    double hs3,
    double hs6,
  ) async {
    try {
      await client.post(
        'admin_diem_update',
        {
          "maBD": maDiem,
          "maMonHoc": maMH,
          "maHocKy": maHK,
          "maNamhoc": maNH,
          "maGiangVien": maGV,
          "maTinChi": maTC,
          "maTheLoai": maTL,
          "maSinhVien": maSV,
          "heso1": hs1,
          "heso3": hs3,
          "heso6": hs6,
          "tongDiem": hs1 * 0.1 + hs3 * 0.3 + hs6 * 0.6
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future deleteScore(int id) async {
    try {
      await client.post('admin_diem_delete', {'maBD': id});
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TimeTable>> getTimeTable() async {
    try {
      final response = await client.get('admin_tkb');
      if (response.statusCode == 200) {
        Iterable data = jsonDecode(response.body)['thoikhoabieu'];
        List<TimeTable> list = data.map((e) => TimeTable.fromJson(e)).toList();
        return list;
      } else {
        throw Exception('Lỗi');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future addTimeTable({
    required int maLop,
    required String maMH,
    required String maGv,
    required String day,
    required String start,
    required String end,
    required String room,
  }) async {
    try {
      await client.post(
        'admin_tkb',
        {
          "maLop": maLop,
          "maMH": maMH,
          "maGV": maGv,
          "ngayHoc": day,
          "gioBatDau": start,
          "gioKetThuc": end,
          "phongHoc": room,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future updateTimeTable({
    required int maTKB,
    required int maLop,
    required String maMH,
    required String maGv,
    required String day,
    required String start,
    required String end,
    required String room,
  }) async {
    try {
      await client.post(
        'admin_tkb_update',
        {
          "maTKB": maTKB,
          "maLop": maLop,
          "maMH": maMH,
          "maGV": maGv,
          "ngayHoc": day,
          "gioBatDau": start,
          "gioKetThuc": end,
          "phongHoc": room,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future deleteTimeTable(int id) async {
    try {
      await client.post('admin_tkb_delete', {'maTKB': id});
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Khoa>> getDepartment() async {
    try {
      final response = await client.get('admin_khoa');
      if (response.statusCode == 200) {
        Iterable data = jsonDecode(response.body);
        List<Khoa> list = data.map((e) => Khoa.fromJson(e)).toList();
        return list;
      } else {
        throw Exception('Lỗi');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<HocKy>> getHocKy() async {
    try {
      final response = await client.get('admin_hocky');
      if (response.statusCode == 200) {
        Iterable data = jsonDecode(response.body);
        List<HocKy> list = data.map((e) => HocKy.fromJson(e)).toList();
        return list;
      } else {
        throw Exception('Lỗi');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Lop>> getClass() async {
    try {
      final response = await client.get('admin_lop');
      if (response.statusCode == 200) {
        Iterable data = jsonDecode(response.body)['lopList'];
        List<Lop> list = data.map((e) => Lop.fromJson(e)).toList();
        return list;
      } else {
        throw Exception('Lỗi');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getNienKhoa() async {
    try {
      final response = await client.get('admin_nienkhoa');
      if (response.statusCode == 200) {
        Iterable data = jsonDecode(response.body)['nienKhoaList'];
        return data.map((e) => e as Map<String, dynamic>).toList();
      } else {
        throw Exception('Lỗi');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<NamHoc>> getSchoolYear() async {
    try {
      final response = await client.get('admin_namhoc');
      if (response.statusCode == 200) {
        Iterable data = jsonDecode(response.body)['namHocList'];
        return data.map((e) => NamHoc.fromJson(e)).toList();
      } else {
        throw Exception('Lỗi');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Subject>> getSubject() async {
    try {
      final response = await client.get('admin_monhoc');
      if (response.statusCode == 200) {
        Iterable data = jsonDecode(response.body)['monHocList'];
        List<Subject> list = data.map((e) => Subject.fromJson(e)).toList();
        return list;
      } else {
        throw Exception('Lỗi');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Tinchi>> getTinChi() async {
    try {
      final response = await client.get('admin_tinchi');
      if (response.statusCode == 200) {
        Iterable data = jsonDecode(response.body)['tinchiList'];
        List<Tinchi> list = data.map((e) => Tinchi.fromJson(e)).toList();
        return list;
      } else {
        throw Exception('Lỗi');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Theloai>> getTheLoai() async {
    try {
      final response = await client.get('admin_theloai');
      if (response.statusCode == 200) {
        Iterable data = jsonDecode(response.body)['theLoaiList'];
        List<Theloai> list = data.map((e) => Theloai.fromJson(e)).toList();
        return list;
      } else {
        throw Exception('Lỗi');
      }
    } catch (e) {
      rethrow;
    }
  }
}
