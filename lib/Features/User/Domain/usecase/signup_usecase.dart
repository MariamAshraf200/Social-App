import 'package:dartz/dartz.dart';
import 'package:fire/Features/User/Domain/entities/user_entity.dart';
import 'package:fire/Features/User/Domain/reposatories/user_repo.dart';
import 'package:fire/global/Errors/failures.dart';

class SignUpUseCase{
  final UserRepo repo;

  SignUpUseCase({required this.repo});
  Future<Either<Failures, UserEntity>> call(String name,String email, String password,String phone) async {
    return await repo.signUp(name, phone, email, password);
  }
}