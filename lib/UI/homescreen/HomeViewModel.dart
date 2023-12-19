import 'package:e_commerce/domain/model/Product.dart';
import 'package:e_commerce/domain/usecase/GetMostSellingUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/model/Category.dart';
import '../../domain/usecase/GetCategoriesUseCase.dart';

@injectable
class HomeViewModel extends Cubit<HomeTabState> {
  GetCategoriesUseCase getCategoriesUseCase;
  GetMostSellingUseCase getMostSellingUseCase;
  @factoryMethod HomeViewModel(this.getCategoriesUseCase,this.getMostSellingUseCase):super(Loading());

  void initPage() async {
    emit(Loading());
    try {
      var categories = await getCategoriesUseCase.invoke();
      var mostSelling = await getMostSellingUseCase.invoke();

      if (categories != null && mostSelling != null) {
        emit(Success(categories, mostSelling));
      } else {
        print('Error: Null data received');
        emit(Error('Null data received'));
      }
    } catch (e) {
      print('Error: $e');
      emit(Error(e.toString()));
    }
  }


}

sealed class HomeTabState{}

class Loading extends HomeTabState{}

class Error extends HomeTabState{
    String? message;
    Error([this.message]);
}

class Success extends HomeTabState{
   List<Category>? categories;
   List<Product>? products;

   Success(this.categories,this.products);
}

