import 'package:fire/Features/Posts/Domain/Entities/post_entity.dart';
import 'package:flutter/material.dart';

class LoadedPost extends StatelessWidget {
  final List<PostsEntity> posts;

  const LoadedPost({super.key, required this.posts});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context,index){
          return ListTile(
            title: Text(posts[index].title),
            subtitle: Text(posts[index].body),
           // trailing: Text(posts[index].postTime),
            onTap: (){},//ToDo impl
          );
        },
        separatorBuilder: (context, index) => Divider(
              thickness: 1,
            ),
        itemCount: posts.length);
  }
}
