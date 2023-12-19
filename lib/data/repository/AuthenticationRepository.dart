import 'package:e_commerce/data/datascourceContracts/AuthenticationDataSource.dart';
import 'package:e_commerce/domain/model/User.dart';
import 'package:e_commerce/domain/repository/AuthenticationRepository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthenticationRepository)
class AuthenticationRepositoryImpl extends AuthenticationRepository{

  AuthenticationDataSource authenticationOnlineDataSource;
  @factoryMethod AuthenticationRepositoryImpl(this.authenticationOnlineDataSource);

  @override
  Future<User?> register(String name, String email, String phone,
      String password, String rePassword
      ) {
    return authenticationOnlineDataSource.register(name, email, phone,
        password, rePassword);
  }

  @override
  Future<User?> login(String email, String password) {
    return authenticationOnlineDataSource.login(email, password);
  }

}