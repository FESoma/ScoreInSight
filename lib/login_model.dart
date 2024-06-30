// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login_model loginFromJson(String str) => Login_model.fromJson(json.decode(str));

String loginToJson(Login_model data) => json.encode(data.toJson());

class Login_model {
  String id;
  String name;
  String username;
  String roll;
  String dept;
  String emailId;
  String password;
  DateTime createdAt;

  Login_model({
    required this.id,
    required this.name,
    required this.username,
    required this.roll,
    required this.dept,
    required this.emailId,
    required this.password,
    required this.createdAt,
  });

  factory Login_model.fromJson(Map<String, dynamic> json) => Login_model(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    roll: json["roll"],
    dept: json["dept"],
    emailId: json["email_id"],
    password: json["password"],
    createdAt: DateTime.parse(json["created at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "roll": roll,
    "dept": dept,
    "email_id": emailId,
    "password": password,
    "created at": createdAt.toIso8601String(),
  };
}
