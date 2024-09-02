
import 'package:fire/Features/User/Data/models/user_model.dart';

abstract class UserLocalDatasource{
  Future<void>cachUser(UserModel user);
  Future<UserModel?>getCachUser();
  Future<void>clearUser();
}