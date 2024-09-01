import 'package:fire/Features/Posts/Domain/Entities/post_entity.dart';
import 'package:fire/Features/Posts/Presentation/Pages/post_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadedPost extends StatelessWidget {
  final List<PostsEntity> posts;

  const LoadedPost({super.key, required this.posts});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              posts[index].title,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              posts[index].body,
              style: const TextStyle(fontSize: 18),
            ),
            onTap: () =>Navigator.push(context,MaterialPageRoute(builder: (context) => PostDetail(post: posts[index], context: context,),)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          );
          
        },
        separatorBuilder: (context, index) =>
            const Divider(thickness: 1, color: Colors.grey),
        itemCount: posts.length);
  }
}
