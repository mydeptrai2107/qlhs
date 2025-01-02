import 'dart:convert';

import 'package:qlhs/models/class.dart';
import 'package:qlhs/models/khoa.dart';
import 'package:qlhs/models/score.dart';
import 'package:qlhs/models/semester.dart';
import 'package:qlhs/models/student.dart';
import 'package:qlhs/models/subject.dart';
import 'package:qlhs/repository/client.dart';
import 'package:qlhs/utils/constant.dart';
import 'package:qlhs/utils/storage.dart';

class Repository {
  final client = Client();

  Future login(String email, String pass) async {
    try {
      final response =
          await client.post('login', {'username': email, 'password': pass});
      if (response.statusCode == 200) {
        await Storage.setString(kToken, jsonDecode(response.body)['token']);
      } else {
        throw Exception('Sai tên đăng nhập hoặc mật khẩu');
      }
    } catch (e) {
      rethrow;
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

  Future<List<Semester>> getSemester() async {
    try {
      final response = await client.get('hocky');
      if (response.statusCode == 200) {
        Iterable data = jsonDecode(response.body);
        List<Semester> list = data.map((e) => Semester.fromJson(e)).toList();
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
}
