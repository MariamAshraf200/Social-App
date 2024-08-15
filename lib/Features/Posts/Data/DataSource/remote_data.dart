import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fire/Features/Posts/Data/Models/post_model.dart';

abstract class PostsRemoteDataSource {
  Future<List<PostModel>>getAllPost();
  Future<Unit>deletPost(int PostId);
  Future<Unit>addPost(PostModel post);
}
class PostRemoTeDataSourceImpl extends PostsRemoteDataSource{
  final FirebaseFirestore firestore;

  PostRemoTeDataSourceImpl({required this.firestore});
  @override
  Future<Unit> addPost(PostModel post) async {
    try {
      await firestore.collection('posts').doc(post.postId).set(
          post.tojson());
      return unit;
    } catch(e){
      throw Exception('faild add post : $e ');
    }

  }
  @override
  Future<List<PostModel>> getAllPost() async {
    try {
      final querySnapshot = await firestore.collection('posts').get();
      return querySnapshot.docs
          .map((doc) => PostModel.fromjson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Failed to get posts: $e');
    }
  }

  Future<Unit> deletPost(int postId) async {
    try {
      await firestore.collection('posts').doc(postId.toString()).delete();
      return unit;
    } catch (e) {
      throw Exception('Failed to delete post: $e');
    }
  }

}
