import 'package:equatable/equatable.dart';

import '../../../Domain/entities/user_entity.dart';

abstract class Userstate extends Equatable{
  @override


  List<Object?> get props => [];
}
class IntialUerState extends Userstate{
}
class LoadingUserState extends Userstate{}
class LoadedUserState extends Userstate{
  final List<UserEntity> users;

  LoadedUserState({required this.users});
  @override
  List<Object?> get props => [users];
}
class ErrorUserState extends Userstate{
  final String message;

  ErrorUserState({required this.message});
@override
  List<Object?> get props => [message];

}