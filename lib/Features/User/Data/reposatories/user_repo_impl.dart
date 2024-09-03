import 'package:dartz/dartz.dart';
import 'package:fire/Features/User/Data/dataSource/user_local_dataSource.dart';
import 'package:fire/Features/User/Data/dataSource/user_remote_dataScource.dart';
import 'package:fire/Features/User/Data/models/user_model.dart';
import 'package:fire/Features/User/Domain/entities/user_entity.dart';
import 'package:fire/Features/User/Domain/reposatories/user_repo.dart';
import 'package:fire/global/Errors/exceptions.dart';
import 'package:fire/global/Errors/failures.dart';

import '../../../../global/network_info.dart';

class UserRepoImpl implements UserRepo {
  final UserRemoteDatascource remoteDatascource;
  final UserLocalDatasource localDatasource;
  final NetworkInfo networkInfo;

  UserRepoImpl(
      {required this.networkInfo,
      required this.remoteDatascource,
      required this.localDatasource});
  @override
  Future<Either<Failures, List<UserEntity>>> getAllUser() async {
    if (await networkInfo.isConnected) {
      try {
        final List<UserModel> remotesUser =
            await remoteDatascource.GetAllUsers();
        final List<UserEntity> userEntities = remotesUser
            .map((userModel) => UserEntity(
                name: userModel.name,
                id: userModel.id,
                phone: userModel.phone,
                email: userModel.email))
            .toList();
        return Right(userEntities);
      } catch (e) {
        return Left(serverFailure());
      }
    } else {
      return Left(offlineFailure());
    }
  }

  @override
  Future<Either<Failures, UserEntity>> logIn(
      String password, String email) async {
    if (await networkInfo.isConnected) {
      try {
        final usermodel = await remoteDatascource.LoginIn(email, password);
        await localDatasource.cachUser(usermodel);

        final UserEntity userEntity = UserEntity(
            name: usermodel.name,
            id: usermodel.id,
            phone: usermodel.phone,
            email: usermodel.email);
        return Right(userEntity);
      } on serverExceptions {
        return Left(serverFailure());
      } on wrongDataExceptions {
        return Left(wrongDataFailure());
      }
    } else {
      return Left(offlineFailure());
    }
  }

  @override
  Future<Either<Failures, Unit>> logOut() async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDatascource.LogOut();
        await localDatasource.clearUser();
        return Right(unit);
      } catch (e) {
        return Left(serverFailure());
      }
    }
    return Left(offlineFailure());
  }

  @override
  Future<Either<Failures, Unit>> resetPassword(String email) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDatascource.ResetPassword(email);
      } catch (e) {
        return Left(serverFailure());
      }
    }
    return Left(offlineFailure());
  }

  @override
  Future<Either<Failures, UserEntity>> signUp(
      String name, String phone, String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final UserModel userModel =
            await remoteDatascource.SignUp(name, email, phone, password);
        await localDatasource.cachUser(userModel);
        UserEntity userEntity = UserEntity(
            name: userModel.name,
            id: userModel.id,
            phone: userModel.phone,
            email: userModel.email);
        return Right(userEntity);
      } catch (e) {
        return Left(serverFailure());
      }
    }
    return Left(offlineFailure());
  }
}
