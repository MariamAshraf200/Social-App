import 'package:dartz/dartz.dart';
import 'package:fire/Features/Posts/Data/Models/post_model.dart';

abstract class PostsRemoteDataSource {
  Future<List<PostModel>>getAllPost();
  Future<Unit>deletPost(int PostId);
  Future<Unit>addPost(PostModel post);
}
class PostRemoTeDataSourceImpl extends PostsRemoteDataSource{
  @override
  Future<Unit> addPost(PostModel post) {
    // TODO: implement dPost
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getAllPost() {
    // TODO: implement getAllPost
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletPost(int PostId) {
    // TODO: implement odeletPost
    throw UnimplementedError();
  }

}