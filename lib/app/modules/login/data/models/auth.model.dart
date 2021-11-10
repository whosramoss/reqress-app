import 'package:reqresapp/app/modules/login/domain/entities/auth.entity.dart';

class AuthModel implements Auth {
  String id;
  String email;
  String password;
  AuthModel({
    this.id,
    this.email,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
    };
  }

  AuthModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
  }
}
