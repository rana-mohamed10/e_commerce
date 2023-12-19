import '../../domain/model/User.dart';

abstract class AuthenticationDataSource{
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