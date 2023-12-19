import 'package:e_commerce/domain/model/Category.dart';
import 'package:e_commerce/domain/model/Product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecase/GetProductsUseCase.dart';


@injectable
class CatalogViewModel extends Cubit<ProductsState>{
  GetProductsUseCase getProductsUseCase;
  Category? category;
  @factoryMethod CatalogViewModel(
      this.getProductsUseCase
      ):super(LoadingState()){
  }

  void loadProducts([Category? category]) async {
    this.category = category;
    // print('category ${category?.id}');
    try{
      emit(LoadingState());
    var products= await getProductsUseCase.invoke(category: this.category);
    emit(SuccessState(products));
    }
    catch(e){
        emit(ErrorState(e.toString()));
    }
  }

}

sealed class ProductsState{}

class LoadingState extends ProductsState{}
class SuccessState extends ProductsState{
  List<Product>? products=[];
  SuccessState(this.products);
}
class ErrorState extends ProductsState{
  String? message;
  ErrorState(this.message);
}
