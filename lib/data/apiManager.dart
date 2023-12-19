import 'dart:convert';
import 'package:e_commerce/data/LoggingInterceptor.dart';
import 'package:e_commerce/data/model/MyRequestResponse.dart';
import 'package:e_commerce/data/model/categoriesResponse/CategoriesResponse.dart';
import 'package:e_commerce/domain/repository/ProductsRepository.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'model/auth/LoginResponse.dart';
import 'model/auth/RegisterResponse.dart';
import 'model/productsResponse/ProductsResponse.dart';

@singleton
@injectable
class ApiManager{

  static const String baseURL='ecommerce.routemisr.com';
  Client client = InterceptedClient.build(interceptors: [
    LoggingInterceptor(),
  ]);
  Future<CategoriesResponse>getCategories() async{
    var url=Uri.https(baseURL,"api/v1/categories");
    var response=await client.get(url);
    var categoriesResponse=CategoriesResponse.fromJson(
        jsonDecode(response.body));
    return categoriesResponse;
  }

  Future<ProductsResponse>getProducts({ProductSort? sort, String? categoryId}) async{
    var params={};
    if(sort !=null){
      params['sort']=sort.value;
    }
    if(categoryId !=null){
      params['category[in]']=categoryId;
    }
    var url=Uri.https(baseURL,"api/v1/products");
    var response=await client.get(url);
    var productsResponse=ProductsResponse.fromJson(
        jsonDecode(response.body));
    return productsResponse;
  }

  Future<RegisterResponse> register(String name, String email, String phone, String password, String rePassword) async{
    var url=Uri.https(baseURL,"api/v1/auth/signup");
    var requestBody=MyRequestResponse(
      name: name,
      email: email,
      phone: phone,
      password: password,
      rePassword: rePassword
    );
    var response=await client.post(url,body:jsonEncode(requestBody),
        headers: {
      "Content-Type":"application/json"
        });
    var json=jsonDecode(response.body);
    print(json);
    var registerResponse= RegisterResponse.fromJson(json);
    return registerResponse;

  }

  Future<LoginResponse> login(String email, String password) async{
    var url=Uri.https(baseURL,"api/v1/auth/signin");
    var requestBody=MyRequestResponse(
        email: email,
        password: password,
    );
    print("requestBody $requestBody");

    var response=await client.post(url,body:jsonEncode(requestBody),
        headers: {
          "Content-Type":"application/json",
        });
    print("Responsee ${jsonEncode(requestBody)}");
    var json=jsonDecode(response.body);
    print("My Response $json");
    var loginResponse= LoginResponse.fromJson(json);
    return loginResponse;

  }


}