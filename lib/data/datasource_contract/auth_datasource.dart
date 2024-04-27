import 'package:ecommerce_app_c10_frida/data/model/auth_response/AuthResponse.dart';
import 'package:dartz/dartz.dart';
abstract class AuthDataSource{
  Future<Either<AuthResponse, String>> signUp({
    required String email,
  required String password,
    required String mobileNumber,
    required String name,
  });

  Future<Either<AuthResponse, String>> signIn({
    required String email, required String password
});

}