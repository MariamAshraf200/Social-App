
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fire/Features/User/Domain/entities/user_entity.dart';
import 'package:fire/Features/User/Domain/usecase/getalluser_usecase.dart';
import 'package:fire/Features/User/Presentation/bloc/user_bloc/userEvent.dart';
import 'package:fire/Features/User/Presentation/bloc/user_bloc/userState.dart';
import 'package:fire/global/Errors/failures.dart';

import '../../../../../global/strings/strings_failure.dart';

class UserBloc extends Bloc<UserEvent,Userstate>{
  final GetalluserUsecase getAllUser;

  UserBloc({required this.getAllUser}):super(IntialUerState()) {
    on<GetAllUserEvent>(_fetchAllUsers);
  }
      Future <void> _fetchAllUsers(GetAllUserEvent event, Emitter<Userstate> emit)async{
    emit(LoadingUserState());
   final Either<Failures,List<UserEntity>> results = await getAllUser();
results.fold(
  (failure)=>emit(ErrorUserState(message: failureMessage(failure)))
,
    (users)=>emit(LoadedUserState(users: users))
);
      }

  String failureMessage(Failures failure) {
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





