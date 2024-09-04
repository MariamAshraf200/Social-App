
import 'package:equatable/equatable.dart';

abstract class AuthUserEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class LoginEvent extends AuthUserEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
  @override
  List<Object?> get props => [email,password];

}

class SignUpEvent extends AuthUserEvent{
  final String name;
  final String password;
  final String email;
   final String phone;

  SignUpEvent({required this.name, required this.password, required this.email, required this.phone});
@override

  List<Object?> get props =>[email,phone,password,name];
}

class LogoutEvent extends AuthUserEvent {
  @override
  List<Object?> get props => [];

}
class resetPasswordEvent extends AuthUserEvent{
final  String email;

  resetPasswordEvent({required this.email});
  @override

  List<Object?> get props => [email];
}