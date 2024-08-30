import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fire/Features/Posts/Domain/UseCase/addPosts.dart';
import 'package:fire/Features/Posts/Domain/UseCase/deletPosts.dart';
import 'package:fire/Features/Posts/Presentation/bloc/AddDelete/add_del_event.dart';
import 'package:fire/Features/Posts/Presentation/bloc/AddDelete/add_del_state.dart';
import 'package:fire/global/Errors/failures.dart';
import 'package:fire/global/strings/strings_failure.dart';
import 'package:fire/global/strings/strings_message.dart';


class AddDelBloc extends Bloc<AddDelEvent, AddDelState> {
  final addPostUseCase addPost;
  final deletPostUseCase deletePost;

  AddDelBloc(this.addPost, this.deletePost) : super(IntialAddDeletPost()) {
    on<AddPostEvent>(_onAddPostEvent);
    on<DeletePostEvent>(_onDeletePostEvent);
  }

  Future<void> _onAddPostEvent(AddPostEvent event, Emitter<AddDelState> emit) async {
    emit(LoadingAddDeletPost());
    final failureOrMessage = await addPost(event.posts);
    emit(_mapResultToState(failureOrMessage, addSucessMessage));
  }

  Future<void> _onDeletePostEvent(DeletePostEvent event, Emitter<AddDelState> emit) async {
    emit(LoadingAddDeletPost());
    final failureOrMessage = await deletePost(event.postId);
    emit(_mapResultToState(failureOrMessage, delSucessMessage));
  }

  AddDelState _mapResultToState(Either<Failures, Unit> either, String message) {
    return either.fold(
          (failure) => ErrorAddDeletPost(message: _failureMessage(failure)),
          (_) => LoadedAddDeletPost(message: message),
    );
  }

  String _failureMessage(Failures failure) {
    switch (failure.runtimeType) {
      case serverFailure:
        return serverFailureMassage;
      case offlineFailure:
        return offlineFailureMassage;
      case emptyCachFailure:
        return emptyCachFailureMassage;
      default:
        return "Unexpected Error. Please Try Again Later.";
    }
  }
}
