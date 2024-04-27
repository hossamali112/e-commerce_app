import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_c10_frida/data/model/auth_response/AuthResponse.dart';
import 'package:ecommerce_app_c10_frida/domain/entities/auth_entity/AuthEntity.dart';
import 'package:ecommerce_app_c10_frida/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class SignInUseCase{
  AuthRepository authRepository;
  @factoryMethod
  SignInUseCase({required this.authRepository});

  Future<Either<AuthEntity
  , String>> invoke({required String email, required String password}){
  return authRepository.signIn(email: email, password: password);
}
}