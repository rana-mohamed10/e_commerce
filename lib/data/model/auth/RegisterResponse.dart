import '../../../domain/model/User.dart';
import 'UserDto.dart';

/// message : "success"
/// user : {"name":"Rana Mohamed","email":"ranam@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1N2NjZWQ1MGFmMGJiMmJlYmI4ZmM4MyIsIm5hbWUiOiJSYW5hIE1vaGFtZWQiLCJyb2xlIjoidXNlciIsImlhdCI6MTcwMjY3ODIzMCwiZXhwIjoxNzEwNDU0MjMwfQ.Q69XrOUGtooVxcYlli1_dDqp8h3n8HjEqmVYwknFyr0"

class RegisterResponse {
  RegisterResponse({
      this.message, 
      this.user, 
      this.token,});

  RegisterResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  UserDto? user;
  String? token;
RegisterResponse copyWith({  String? message,
  UserDto? user,
  String? token,
}) => RegisterResponse(  message: message ?? this.message,
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