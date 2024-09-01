import 'package:dartz/dartz.dart';
import 'package:fire/Features/User/Domain/reposatories/user_repo.dart';
import 'package:fire/global/Errors/failures.dart';

class LogOutUsecase{
  final UserRepo repo;

  LogOutUsecase({required this.repo});
  Future<Either<Failures,Unit>> call() async {
    return await repo.logOut();
  }
}