import 'package:fire/Features/Posts/Domain/Entities/post_entity.dart';
import 'package:fire/Features/Posts/Presentation/Pages/post_page.dart';
import 'package:fire/Features/Posts/Presentation/Widets/Add_Del_posts/delete_widget.dart';
import 'package:fire/Features/Posts/Presentation/bloc/AddDelete/add_del_bloc.dart';
import 'package:fire/Features/Posts/Presentation/bloc/AddDelete/add_del_state.dart';
import 'package:fire/global/util/snack_bar.dart';
import 'package:fire/global/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDetail extends StatelessWidget {
  final PostsEntity post;
  final BuildContext context;
  const PostDetail({super.key, required this.post, required this.context});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() => AppBar(
        title: Text('Post Detail'),
      );

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                post.title,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(color: Colors.grey),
          Text(
            post.body,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () => deletePost(context),
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.delete,
                    size: 35,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Delete',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ],
              ))
        ],
      ),
    );
  }


 void deletePost(BuildContext context) {
    showDialog(context: context, builder:(contexxt){
      return BlocConsumer<AddDelBloc,AddDelState>(
        listener: (context,state){
          if(state is LoadedAddDeletPost){
            ShowSnackBar().showSuccessSnackBar(state.message, context);
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => PostPage(),),(route) => false, );
          }
          else if(state is ErrorAddDeletPost){
            Navigator.pop(context);
            ShowSnackBar().showErrorSnackBar(state.message, context);

          }
        },
        builder: (context,state){
          if(state is LoadingAddDeletPost){
            return AlertDialog(
               title: LoadingWidget(),
            );
          }
          return DeleteWidget(PostId:post.id!);
        },
      );
    } );
 }
}
