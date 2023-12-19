import 'package:e_commerce/domain/model/User.dart';

abstract class AuthenticationRepository{
  Future<User?> register(
      String name,
      String email,
      String phone,
      String password,
      String rePassword
      );

  Future<User?> login(
      String email,
      String password,
      );
}