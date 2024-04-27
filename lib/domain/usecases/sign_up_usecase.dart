import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_c10_frida/domain/entities/auth_entity/AuthEntity.dart';
import 'package:ecommerce_app_c10_frida/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class SignUpUseCase {
  AuthRepository authRepository;
@factoryMethod
  SignUpUseCase({required this.authRepository});

 Future<Either<AuthEntity, String>> invoke({
    required String email,
    required String password,
    required String mobileNumber,
    required String name,
  }) {
   return authRepository.signUp(email: email,
        password: password,
        mobileNumber: mobileNumber,
        name: name);
  }
}