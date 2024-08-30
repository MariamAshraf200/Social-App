import 'package:fire/Features/Posts/Domain/Entities/post_entity.dart';
import 'package:fire/Features/Posts/Presentation/bloc/AddDelete/add_del_bloc.dart';
import 'package:fire/Features/Posts/Presentation/bloc/AddDelete/add_del_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormWidget extends StatelessWidget {
  FormWidget({super.key});
  final _formKKey = GlobalKey<FormState>();
  final TextEditingController _titlecontroller = TextEditingController();
  final TextEditingController _bodycontroller = TextEditingController();

  void validateAddPost(BuildContext context){
    final isValidate = _formKKey.currentState!.validate();
    if(isValidate){
      final post =PostsEntity(id: null, body: _bodycontroller.text, title: _titlecontroller.text);
    BlocProvider.of<AddDelBloc>(context).add(AddPostEvent(posts: post));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _titlecontroller,
                validator: (val) =>
                    val!.isEmpty ? 'The Title Can\'t Be Empty' : null,
                decoration: InputDecoration(
                    hintText: 'title',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _bodycontroller,
                validator: (val) =>
                    val!.isEmpty ? 'The Body Can\'t Be Empty' : null,
                decoration: InputDecoration(
                  hintText: 'body',
                  hintStyle: TextStyle(color: Colors.blueGrey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                maxLines: 6,
                minLines: 6,
              ),
            ),
            SizedBox(
              height: 30,

            ),
            ElevatedButton(
              onPressed:()=> validateAddPost(context),
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
