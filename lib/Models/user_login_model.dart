
import 'dart:convert';

UserLoginModel userLoginModelFromJson(String str) => UserLoginModel.fromJson(json.decode(str));

String userLoginModelToJson(UserLoginModel data) => json.encode(data.toJson());

class UserLoginModel {
  String? status;
  String? message;
  User? user;
  Authorisation? authorisation;

  UserLoginModel({
    this.status, this.message,
    this.user,
    this.authorisation,
  });

  factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
    status: json["status"],
    user: User.fromJson(json["user"]),
    message : json["message"] != null ? json["message"] : null,
    authorisation: Authorisation.fromJson(json["authorisation"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "user": user!.toJson(),
    "authorisation": authorisation!.toJson(),
  };
}

class Authorisation {
  String? token;
  String? type;

  Authorisation({
    this.token,
    this.type,
  });

  factory Authorisation.fromJson(Map<String, dynamic> json) => Authorisation(
    token: json["token"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "type": type,
  };
}

class User {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  dynamic isAdmin;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.isAdmin,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    isAdmin: json["is_admin"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "is_admin": isAdmin,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
