import 'package:fire/Features/Posts/Presentation/bloc/AddDelete/add_del_bloc.dart';
import 'package:fire/Features/Posts/Presentation/bloc/AddDelete/add_del_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteWidget extends StatelessWidget {

 final String PostId;
  const DeleteWidget({super.key, required this.PostId});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Are You Sure For Delete Post'),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('No')),
        TextButton(onPressed: (){
          BlocProvider.of<AddDelBloc>(context).add(DeletePostEvent(postId: PostId));
        }, child: Text('Yes'))
      ]
      ,
    );
  }
}
