import 'package:dartz/dartz.dart';
import 'package:fire/Features/User/Domain/entities/user_entity.dart';
import 'package:fire/Features/User/Domain/reposatories/user_repo.dart';
import 'package:fire/global/Errors/failures.dart';

class LoginUsecase{
  final UserRepo repo;

  LoginUsecase({required this.repo});
  Future<Either<Failures, UserEntity>> call(String email,String password) async {
    return await repo.logIn(password, email);
  }

}