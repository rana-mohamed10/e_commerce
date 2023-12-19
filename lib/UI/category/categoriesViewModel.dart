import 'package:e_commerce/domain/model/Category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecase/GetCategoriesUseCase.dart';

@injectable
class CategoriesViewModel extends Cubit<CategoriesState>{
  GetCategoriesUseCase getCategoriesUseCase;
  @factoryMethod CategoriesViewModel(
      this.getCategoriesUseCase
      ):super(LoadingState()){
    loadCategories();
  }

  void loadCategories() async {
    try{
      emit(LoadingState());
    var categories= await getCategoriesUseCase.invoke();
    emit(SuccessState(categories!));
    }
    catch(e){
        emit(ErrorState(e.toString()));
    }
  }

}

sealed class CategoriesState{}

class LoadingState extends CategoriesState{}
class SuccessState extends CategoriesState{
  List<Category> categories=[];
  SuccessState(this.categories);
}
class ErrorState extends CategoriesState{
  String? message;
  ErrorState(this.message);
}
