// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.email,
    this.firstName,
    this.lastName,
    this.phone,
    this.area,
    this.profilePicture,
    this.expired,
    this.role,
    this.menu,
  });

  String? email;
  String? firstName;
  String? lastName;
  dynamic phone;
  String? area;
  dynamic profilePicture;
  DateTime? expired;
  String? role;
  List<Menu>? menu;

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phone: json["phone"],
        area: json["area"],
        profilePicture: json["profilePicture"],
        expired:
            json["expired"] == null ? null : DateTime.parse(json["expired"]),
        role: json["role"],
        menu: json["menu"] == null
            ? []
            : List<Menu>.from(json["menu"]!.map((x) => Menu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "area": area,
        "profilePicture": profilePicture,
        "expired": expired?.toIso8601String(),
        "role": role,
        "menu": menu == null
            ? []
            : List<dynamic>.from(menu!.map((x) => x.toJson())),
      };
}

class Menu {
  Menu({
    this.name,
    this.url,
    this.seq,
    this.detail,
  });

  String? name;
  String? url;
  String? seq;
  List<Menu>? detail;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        name: json["name"],
        url: json["url"],
        seq: json["seq"],
        detail: json["detail"] == null
            ? []
            : List<Menu>.from(json["detail"]!.map((x) => Menu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "seq": seq,
        "detail": detail == null
            ? []
            : List<dynamic>.from(detail!.map((x) => x.toJson())),
      };
}
