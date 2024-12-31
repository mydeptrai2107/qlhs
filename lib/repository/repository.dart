import 'dart:convert';

import 'package:qlhs/models/student.dart';
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
        print(response.body);
      } else {
        throw Exception('Sai tên đăng nhập hoặc mật khẩu');
      }
    } catch (e) {
      rethrow;
    }
  }
}
