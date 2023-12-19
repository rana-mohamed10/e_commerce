import 'package:e_commerce/data/apiManager.dart';
import 'package:e_commerce/data/datascourceContracts/AuthenticationDataSource.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/User.dart';

@Injectable(as: AuthenticationDataSource)
class AuthenticationDataSourceImpl extends AuthenticationDataSource{

  ApiManager apiManager;
  @factoryMethod AuthenticationDataSourceImpl(this.apiManager);
  @override
  Future<User?> register(String name, String email, String phone,
      String password, String rePassword) async {

    var response= await apiManager.register(name, email, phone, password, rePassword);
    return response.toUser();
  }

  @override
  Future<User?> login(String email, String password) async{
    var response= await apiManager.login(email,password);
    return response.toUser();
  }
}