
import 'package:e_commerce/domain/repository/AuthenticationRepository.dart';
import 'package:injectable/injectable.dart';

import '../model/User.dart';

@injectable
class LoginUseCase{

  AuthenticationRepository repository;
  @factoryMethod LoginUseCase(this.repository);

  Future<User?>invoke(String email, String password){
    return repository.login(email,password);
  }
}