import 'package:dartz/dartz.dart';
import 'package:fire/Features/User/Domain/reposatories/user_repo.dart';
import 'package:fire/global/Errors/failures.dart';

class ResetPasswordUseCase {
  final UserRepo repo;

  ResetPasswordUseCase({required this.repo});
  Future<Either<Failures,Unit>> call(String mail) async {
    return await repo.resetPassword(mail);
  }
}