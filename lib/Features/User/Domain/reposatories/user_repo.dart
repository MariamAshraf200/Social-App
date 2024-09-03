import 'package:dartz/dartz.dart';
import 'package:fire/Features/User/Domain/entities/user_entity.dart';
import 'package:fire/global/Errors/failures.dart';

abstract class UserRepo {
  Future<Either<Failures, UserEntity>> logIn(String password, String email);
  Future<Either<Failures, UserEntity>> signUp(
      String name, String phone, String email, String password);
  Future<Either<Failures, List<UserEntity>>> getAllUser();
  Future<Either<Failures, Unit>> resetPassword(String mail);
  Future<Either<Failures, Unit>> logOut();
}
