// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qlhs/models/class.dart';
import 'package:qlhs/models/khoa.dart';
import 'package:qlhs/models/score.dart';
import 'package:qlhs/models/semester.dart';
import 'package:qlhs/models/student.dart';
import 'package:qlhs/models/subject.dart';
import 'package:qlhs/models/time_table.dart';
import 'package:qlhs/models/user_model.dart';
import 'package:qlhs/repository/client.dart';
import 'package:qlhs/utils/constant.dart';
import 'package:qlhs/utils/storage.dart';
import 'package:qlhs/widgets/dialog_service.dart';

class RepositoryStudent {
  final client = Client();

  Future<String> login(String username, String pass) async {
    try {
      final response = await client
          .postNoToken('login', {'username': username, 'password': pass});
      if (response.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(response.body)['user']);
        await Storage.setString(kToken, jsonDecode(response.body)['token']);
        print(user.role.role);
        return user.role.role;
      } else {
        throw FormatException('Sai tên đăng nhập hoặc mật khẩu');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future register(
    BuildContext context,
    String username,
    String pass,
    String email,
  ) async {
    try {
      DialogService.showLoading(context);
      final response = await client.postNoToken(
        'register',
        {'username': username, 'password': pass, 'email': email},
      );
      if (response.statusCode == 200) {
        Navigator.pop(context);
        DialogService.showDialogSuccess(
            context, 'User registered successfully');
      } else {
        Navigator.pop(context);
        DialogService.showDialogFail(context, response.body);
      }
    } catch (e) {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Text(e.toString()),
          );
        },
      );
    }
  }

  Future<Student> profile() async {
    try {
      final response = await client.get('profile');
      if (response.statusCode == 200) {
        return Student.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Lỗi');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future updateProfile(
      String name, String address, String phoneNumber, String email) async {
    try {
      final response = await client.post(
        'profile',
        {
          "tenSV": name,
          "diaChi": address,
          "sdt": int.parse(phoneNumber),
          "email": email,
        },
      );
      if (response.statusCode == 200) {
      } else {
        throw Exception(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Score>> getScore() async {
    try {
      final response = await client.get('diem');
      if (response.statusCode == 200) {
        Iterable data = jsonDecode(response.body);
        List<Score> list = data.map((e) => Score.fromJson(e)).toList();
        return list;
      } else {
        throw Exception('Lỗi');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Khoa>> getDepartment() async {
    try {
      final response = await client.get('khoa');
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

  Future<List<HocKy>> getSemester() async {
    try {
      final response = await client.get('hocky');
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
      final response = await client.get('lop');
      if (response.statusCode == 200) {
        Iterable data = jsonDecode(response.body);
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
      final response = await client.get('nienkhoa');
      if (response.statusCode == 200) {
        Iterable data = jsonDecode(response.body);
        return data.map((e) => e as Map<String, dynamic>).toList();
      } else {
        throw Exception('Lỗi');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getSchoolYear() async {
    try {
      final response = await client.get('namhoc');
      if (response.statusCode == 200) {
        Iterable data = jsonDecode(response.body);
        return data.map((e) => e as Map<String, dynamic>).toList();
      } else {
        throw Exception('Lỗi');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Tinchi>> getPeriod() async {
    try {
      final response = await client.get('tinchi');
      if (response.statusCode == 200) {
        Iterable data = jsonDecode(response.body);
        List<Tinchi> list = data.map((e) => Tinchi.fromJson(e)).toList();
        return list;
      } else {
        throw Exception('Lỗi');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Subject>> getSubject() async {
    try {
      final response = await client.get('monhoc');
      if (response.statusCode == 200) {
        Iterable data = jsonDecode(response.body);
        List<Subject> list = data.map((e) => Subject.fromJson(e)).toList();
        return list;
      } else {
        throw Exception('Lỗi');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Theloai>> getCategory() async {
    try {
      final response = await client.get('theloai');
      if (response.statusCode == 200) {
        Iterable data = jsonDecode(response.body);
        List<Theloai> list = data.map((e) => Theloai.fromJson(e)).toList();
        return list;
      } else {
        throw Exception('Lỗi');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TimeTable>> getTimeTable() async {
    try {
      final response = await client.get('thoikhoabieu');
      if (response.statusCode == 200) {
        Iterable data = jsonDecode(response.body);
        List<TimeTable> list = data.map((e) => TimeTable.fromJson(e)).toList();
        return list;
      } else {
        throw Exception('Lỗi');
      }
    } catch (e) {
      rethrow;
    }
  }
}
