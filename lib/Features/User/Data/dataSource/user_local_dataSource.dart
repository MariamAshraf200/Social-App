import 'dart:convert';
import 'package:fire/Features/User/Data/models/user_model.dart';
import 'package:fire/global/Errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDatasource {
  Future<void> cachUser(UserModel user);
  Future<UserModel?> getCachUser();
  Future<void> clearUser();
}

const _cachUserKey = 'CACHED_USER';

class UserLocalDataSource implements UserLocalDatasource {
  final SharedPreferences sharedPreferences;

  UserLocalDataSource({required this.sharedPreferences});
  @override
  Future<void> cachUser(UserModel user) async {
    final jsonString = jsonEncode(user.toJson());
    await sharedPreferences.setString(_cachUserKey, jsonString);
  }

  @override
  Future<void> clearUser() async {
    await sharedPreferences.remove(_cachUserKey);
  }

  @override
  Future<UserModel> getCachUser() async {
    final jsonString = sharedPreferences.get(_cachUserKey);
    if (jsonString != null) {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString as String);
      return UserModel.fromJson(jsonMap);
    }
    throw emptyCachExceptions();
  }
}
