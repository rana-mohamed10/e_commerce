import 'package:e_commerce/domain/model/Product.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/ProductsRepository.dart';
import '../datascourceContracts/ProductsDataSource.dart';

@Injectable(as: ProductsRepository) //interface of concrete class
class ProductRepositoryImpl extends ProductsRepository{
  ProductsDataSource onlineDataSource;
  @factoryMethod ProductRepositoryImpl(this.onlineDataSource);
  @override
  Future<List<Product>?> getProducts({ProductSort? sort,String? categoryId}) {
    return onlineDataSource.getProducts(sort: sort,categoryId:categoryId);
  }


}