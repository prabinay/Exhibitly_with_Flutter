import 'dart:convert';

class MyUser {
  String? email;
  String? username;
  String? password;
  String? country;
  String? city;
  String? phoneNo;

  String? profilePhoto;
  String? id;
  List? skills;
  String? type;
  String? color;

  MyUser({
    required this.email,
    required this.username,
    required this.password,
    required this.country,
    required this.city,
    required this.phoneNo,
    required this.profilePhoto,
    required this.id,
    required this.skills,
    required this.type,
    required this.color,
  });

  MyUser.fromMap(Map<String, dynamic> map) {
    city = map["city"];
    email = map["email"];
    username = map["username"];
    id = map["id"];
    profilePhoto = map["profilePhoto"];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'username': username,
      'password': password,
      'country': country,
      'city': city,
      'phoneNo': phoneNo,
      'profilePhoto': profilePhoto,
      'id': id,
      'skills': skills,
      'type': type,
      'color': color,
    };
  }

  String toJson() => json.encode(toMap());
}
