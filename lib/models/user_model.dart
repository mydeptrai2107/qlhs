// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int id;
  String username;
  String password;
  String email;
  Role role;

  UserModel({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
        role: Role.fromJson(json["role"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "email": email,
        "role": role.toJson(),
      };
}

class Role {
  int id;
  String role;

  Role({
    required this.id,
    required this.role,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role": role,
      };
}
