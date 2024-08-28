import 'package:fire/Features/Posts/Domain/Entities/post_entity.dart';

class PostModel extends PostsEntity {
  PostModel({required super.id, required super.body, required super.title});

  factory PostModel.fromjson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      body: json['body'],
      title: json['title'],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'body': body,
      'title': title,
    };
  }
}
