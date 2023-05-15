
import 'dart:convert';

UserLogOutModel userLogOutModelFromJson(String str) => UserLogOutModel.fromJson(json.decode(str));

String userLogOutModelToJson(UserLogOutModel data) => json.encode(data.toJson());

class UserLogOutModel {
  String? status;
  String? message;

  UserLogOutModel({
   this.status,
   this.message,
  });

  factory UserLogOutModel.fromJson(Map<String, dynamic> json) => UserLogOutModel(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
