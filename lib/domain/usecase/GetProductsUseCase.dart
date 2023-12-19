import 'package:e_commerce/domain/model/Category.dart';
import 'package:e_commerce/domain/model/Product.dart';
import 'package:e_commerce/domain/repository/ProductsRepository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsUseCase{
  ProductsRepository repository;
  @factoryMethod GetProductsUseCase(this.repository);
  Future<List<Product>?> invoke({Category? category}){
    return repository.getProducts(categoryId: category?.id);
  }
}