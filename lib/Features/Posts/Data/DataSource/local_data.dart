import 'dart:async';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:fire/Features/Posts/Data/Models/post_model.dart';
import 'package:fire/global/Errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getAllCachedPost();
  Future<Unit> cachPost(Future<List<PostModel>> postModels);
}

 class PostLocalDataSourceImpl extends PostLocalDataSource {
  final SharedPreferences sharedPreferencesd;

  PostLocalDataSourceImpl({required this.sharedPreferencesd});


  @override
  Future<List<PostModel>> getAllCachedPost() {
    final jsonString = sharedPreferencesd.getString('Cashed Post');
    if (jsonString != null) {
      List jsonDecodedData = json.decode(jsonString);
      List<PostModel> jsonToPostModel = jsonDecodedData
          .map<PostModel>((jsonPostModel) => PostModel.fromjson(jsonPostModel))
          .toList();
      return Future.value(jsonToPostModel);
    }
    throw emptyCachExceptions;
  }

  @override
  Future<Unit> cachPost(Future<List<PostModel>> postModels) async {
    List<PostModel> postModelList = await postModels;
    List<Map<String, dynamic>> postModelToJson =
    postModelList.map((postModel1) => postModel1.tojson()).toList();
    sharedPreferencesd.setString("Cached Post", json.encode(postModelToJson));
    return Future.value(unit);
  }
}
