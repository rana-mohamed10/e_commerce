import '../../../domain/model/User.dart';

/// message : "success"
/// user : {"name":"Rana Mohamed","email":"rrana@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1N2UyMjIxMTgzYjljMzdjYTBmZmRjOCIsIm5hbWUiOiJSYW5hIE1vaGFtZWQiLCJyb2xlIjoidXNlciIsImlhdCI6MTcwMjc2NTIxNSwiZXhwIjoxNzEwNTQxMjE1fQ.qlWGsALU1mHXvJ0v2UNrUuoO2gMyVYGkVXfSl_IdRUw"

class LoginResponse {
  LoginResponse({
      this.message, 
      this.user, 
      this.token,});

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  User? user;
  String? token;
LoginResponse copyWith({  String? message,
  User? user,
  String? token,
}) => LoginResponse(  message: message ?? this.message,
  user: user ?? this.user,
  token: token ?? this.token,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

  User? toUser(){
    if(user ==null) return null;
    return User(
        name: user?.name,
        email: user?.email,
        role: user?.role,
        token: token
    );
  }
}