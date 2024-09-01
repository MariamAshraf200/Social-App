import 'package:dartz/dartz.dart';
import 'package:fire/Features/User/Domain/entities/user_entity.dart';
import 'package:fire/Features/User/Domain/reposatories/user_repo.dart';
import 'package:fire/global/Errors/failures.dart';

class GetalluserUsecase{
  final UserRepo repo;

  GetalluserUsecase({required this.repo});

  Future<Either<Failures,List<UserEntity>>> call() async {
    return await repo.getAllUser();
  }
}