import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fire/Features/User/Domain/entities/user_entity.dart';
import 'package:fire/Features/User/Domain/usecase/login_usecase.dart';
import 'package:fire/Features/User/Domain/usecase/logout_usecase.dart';
import 'package:fire/Features/User/Domain/usecase/resetPass_usecase.dart';
import 'package:fire/Features/User/Domain/usecase/signup_usecase.dart';
import 'package:fire/Features/User/Presentation/bloc/auth-bloc/authUserEvent.dart';
import 'package:fire/Features/User/Presentation/bloc/auth-bloc/authUserstate.dart';
import 'package:fire/global/Errors/failures.dart';

import '../../../../../global/strings/strings_failure.dart';

class AuThBloc extends Bloc<AuthUserEvent, AuthUserState> {
  final LoginUsecase loginUsecase;
  final SignUpUseCase signUpUseCase;
  final LogOutUsecase logOutUsecase;
  final ResetPasswordUseCase resetPasswordUseCase;

  AuThBloc(
      {required this.loginUsecase,
      required this.signUpUseCase,
      required this.logOutUsecase,
      required this.resetPasswordUseCase})
      : super(IntialAuthState()) {
    on<LoginEvent>(_onlogin);
    on<SignUpEvent>(_onsignup);
    on<LogoutEvent>(_onlogout);
    on<resetPasswordEvent>(_onresetpassword);
  }
  Future<void> _onlogin(LoginEvent event, Emitter<AuthUserState> emit) async {
    emit(LoadingAuthState());
    final Either<Failures, UserEntity> result =
        await loginUsecase(event.password, event.email);
    result.fold((failure) => emit(failureLogin(error: failureMessage(failure))),
        (user) => emit(successLogin()));
  }

  Future<void> _onsignup(SignUpEvent event, Emitter<AuthUserState> emit) async {
    emit(LoadingAuthState());
    final Either<Failures, UserEntity> result = await signUpUseCase(
        event.email, event.password, event.name, event.phone);
    result.fold(
        (failure) => emit(failureSignUp(error: failureMessage(failure))),
        (user) => emit(successSignUp()));
  }

  Future<void> _onresetpassword(
      resetPasswordEvent event, Emitter<AuthUserState> emit) async {
    emit(LoadingAuthState());
    final Either<Failures, Unit> result =
        await resetPasswordUseCase(event.email);
    result.fold(
        (failure) => emit(failureResetPassword(error: failureMessage(failure))),
        (_) => emit(successResetPassword()));
  }

  Future<void> _onlogout(LogoutEvent event, Emitter<AuthUserState> emit) async {
    emit(LoadingAuthState());
    final Either<Failures, Unit> result = await logOutUsecase();
    result.fold(
        (failure) => emit(IntialAuthState()), (_) => emit(successLogout()));
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
