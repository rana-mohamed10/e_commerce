import 'package:e_commerce/data/datascourceContracts/CategoriesDataSource.dart';
import 'package:e_commerce/domain/repository/CategoriesRepository.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/Category.dart';

@Injectable(as: CategoriesRepository) //interface of concrete class
class CategoriesRepositoryImpl extends CategoriesRepository{
  CategoriesDataSource onlineDataSource;
  @factoryMethod CategoriesRepositoryImpl(this.onlineDataSource);
  @override
  Future<List<Category>?> getCategories() {
    return onlineDataSource.getCategories();
  }
}