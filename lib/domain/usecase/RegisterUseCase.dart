
import 'package:e_commerce/domain/repository/AuthenticationRepository.dart';
import 'package:injectable/injectable.dart';

import '../model/User.dart';

@injectable
class RegisterUseCase{

  AuthenticationRepository repository;
  RegisterUseCase(this.repository);

  Future<User?>invoke(String name, String email, String phone,
      String password, String rePassword){
    return repository.register(name, email, phone, password, rePassword);
  }
}