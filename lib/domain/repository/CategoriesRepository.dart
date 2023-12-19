import 'package:e_commerce/domain/model/Category.dart';

abstract class CategoriesRepository{
  Future<List<Category>?> getCategories();
}