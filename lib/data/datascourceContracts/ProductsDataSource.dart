import 'package:e_commerce/domain/model/Product.dart';
import 'package:e_commerce/domain/repository/ProductsRepository.dart';

abstract class ProductsDataSource{
  Future<List<Product>?> getProducts({ProductSort? sort, String? categoryId});
}