import 'package:equatable/equatable.dart';

abstract class AuthUserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class IntialAuthState extends AuthUserState {}

class LoadingAuthState extends AuthUserState {}

// login
class successLogin extends AuthUserState {}

class failureLogin extends AuthUserState {
  final String error;

  failureLogin({required this.error});

  @override
  List<Object?> get props => [error];
}
// signup
class successSignUp extends AuthUserState {}

class failureSignUp extends AuthUserState {
  final String error;

  failureSignUp({required this.error});


  @override
  List<Object?> get props => [error];
}
// resetpassword
class successResetPassword extends AuthUserState {}

class failureResetPassword extends AuthUserState {
  final String error;

  failureResetPassword({required this.error});

  @override
  List<Object?> get props => [error];
}
// logout
class successLogout extends AuthUserState {}

class failureLogout extends AuthUserState {
  final String error;

  failureLogout({required this.error});

  @override
  List<Object?> get props => [error];
}
