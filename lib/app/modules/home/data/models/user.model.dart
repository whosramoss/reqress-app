import 'package:reqresapp/app/modules/home/domain/entities/user.entity.dart';

class UserModel implements User {
  int id;
  String email;
  String firstname;
  String lastname;
  String avatar;
  UserModel({
    this.id,
    this.email,
    this.firstname,
    this.lastname,
    this.avatar,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'avatar': avatar,
    };
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstname = json['first_name'];
    lastname = json['last_name'];
    avatar = json['avatar'];
  }
}
