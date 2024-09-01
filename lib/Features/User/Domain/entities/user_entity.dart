
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
 final String name;
 final String id;
 final String phone;
 final String email;

  const UserEntity({required this.name, required this.id, required this.phone, required this.email});


  @override
  List<Object?> get props => [id,name,phone,email];}