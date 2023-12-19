import 'package:e_commerce/data/apiManager.dart';
import 'package:e_commerce/domain/model/Product.dart';
import 'package:e_commerce/domain/repository/ProductsRepository.dart';
import 'package:injectable/injectable.dart';

import '../datascourceContracts/ProductsDataSource.dart';


@Injectable(as: ProductsDataSource)
class ProductsOnlineDataSource extends ProductsDataSource{
  ApiManager apiManager;
  @factoryMethod ProductsOnlineDataSource(this.apiManager);
  @override
  Future<List<Product>?> getProducts({ProductSort? sort,String? categoryId})async {
    var response=await apiManager.getProducts(sort: sort,categoryId: categoryId);
    return response.data?.map((productDto) => productDto.toProduct()).toList();
  }
}