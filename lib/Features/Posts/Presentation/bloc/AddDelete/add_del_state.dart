import 'package:equatable/equatable.dart';
import 'package:fire/Features/Posts/Domain/Entities/post_entity.dart';

abstract class AddDelState extends Equatable {
  const AddDelState();
  @override
  List<Object?> get props => [];
}

class IntialAddDeletPost extends AddDelState {}

class LoadingAddDeletPost extends AddDelState {}

class ErrorAddDeletPost extends AddDelState {
  final String message;

  ErrorAddDeletPost({required this.message});


  @override
  List<Object?> get props => [message];
}

class LoadedAddDeletPost extends AddDelState {
  final String message;

  LoadedAddDeletPost({required this.message});

  @override
  List<Object?> get props => [message];
}
