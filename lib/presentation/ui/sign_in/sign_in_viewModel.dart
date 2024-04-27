import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_c10_frida/domain/entities/auth_entity/AuthEntity.dart';
import 'package:ecommerce_app_c10_frida/domain/usecases/sign_in_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class SignInViewModel extends Cubit<SignInViewModelState> {
  @factoryMethod SignInViewModel({required this.signInUseCase})
      : super(SignInViewModelInitialState());
  SignInUseCase signInUseCase;

  signIn({required String email, required String password}) async {
    emit(LoadingState());
    var result = await signInUseCase.invoke(email: email, password: password);
    result.fold((response) {
      emit(SuccessState(authEntity: response));
    }, (error) {
      emit(ErrorState(errorMessage: error));
    });
  }
}

sealed class SignInViewModelState {
}

class SignInViewModelInitialState extends SignInViewModelState {
}

class LoadingState extends SignInViewModelState {
}

class SuccessState extends SignInViewModelState {
  AuthEntity authEntity;

  SuccessState({required this.authEntity});
}

class ErrorState extends SignInViewModelState {
  String errorMessage;

  ErrorState({required this.errorMessage});
}