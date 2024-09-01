import 'package:fire/Features/User/Domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.name,
      required super.id,
      required super.phone,
      required super.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'],
        id: json['id'],
        phone: json['phone'],
        email: json['email']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }


}
