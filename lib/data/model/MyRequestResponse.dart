/// name : "Rana Mohamed"
/// email : "ranaM@gmail.com"
/// password : "1234567"
/// rePassword : "1234567"
/// phone : "01010700700"

class MyRequestResponse {
  MyRequestResponse({
      this.name, 
      this.email, 
      this.password, 
      this.rePassword, 
      this.phone,});

  MyRequestResponse.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    rePassword = json['rePassword'];
    phone = json['phone'];
  }
  String? name;
  String? email;
  String? password;
  String? rePassword;
  String? phone;
MyRequestResponse copyWith({  String? name,
  String? email,
  String? password,
  String? rePassword,
  String? phone,
}) => MyRequestResponse(  name: name ?? this.name,
  email: email ?? this.email,
  password: password ?? this.password,
  rePassword: rePassword ?? this.rePassword,
  phone: phone ?? this.phone,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['rePassword'] = rePassword;
    map['phone'] = phone;
    return map;
  }

}