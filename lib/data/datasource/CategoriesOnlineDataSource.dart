import 'package:e_commerce/data/apiManager.dart';
import 'package:e_commerce/data/datascourceContracts/CategoriesDataSource.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/Category.dart';

@Injectable(as: CategoriesDataSource)
class CategoriesOnlineDataSource extends CategoriesDataSource{
  ApiManager apiManager;
  @factoryMethod CategoriesOnlineDataSource(this.apiManager);
  @override
  Future<List<Category>?> getCategories()async {
    var response=await apiManager.getCategories();
    return response.data?.map((catDto) => catDto.toCategory()).toList();
  }
}