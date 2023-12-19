import 'package:e_commerce/domain/model/Category.dart';

abstract class CategoriesDataSource{
  Future<List<Category>?> getCategories();
}