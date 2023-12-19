import 'package:e_commerce/domain/model/Product.dart';
import 'package:e_commerce/domain/repository/ProductsRepository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMostSellingUseCase{
  ProductsRepository repository;
  @factoryMethod GetMostSellingUseCase(this.repository);
  Future<List<Product>?> invoke(){
    return repository.getProducts();
  }
}