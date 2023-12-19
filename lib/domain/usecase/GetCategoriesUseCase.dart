import 'package:e_commerce/domain/model/Category.dart';
import 'package:e_commerce/domain/repository/CategoriesRepository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUseCase{
  CategoriesRepository repository;
  @factoryMethod GetCategoriesUseCase(this.repository);
  Future<List<Category>?> invoke(){
    return repository.getCategories();
  }
}