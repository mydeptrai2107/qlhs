import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qlhs/utils/constant.dart';
import 'package:qlhs/utils/storage.dart';

class Client {
  String baseUrl =
      "https://student-management-api-latest.onrender.com/StudentManagementAPI/";

  Future<http.Response> post(String url, Map<String, dynamic> body) async {
    String loginUrl = '$baseUrl$url';
    final token = Storage.getString(kToken);

    try {
      final response = await http.post(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        Uri.parse(loginUrl),
        body: jsonEncode(body),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> get(String url) async {
    String loginUrl = '$baseUrl$url';
    final token = Storage.getString(kToken);
    try {
      final response = await http.get(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        Uri.parse(loginUrl),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
