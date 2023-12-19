// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/apiManager.dart' as _i3;
import '../data/datascourceContracts/AuthenticationDataSource.dart' as _i4;
import '../data/datascourceContracts/CategoriesDataSource.dart' as _i8;
import '../data/datascourceContracts/ProductsDataSource.dart' as _i15;
import '../data/datasource/AuthenticationOnlineDataSource.dart' as _i5;
import '../data/datasource/CategoriesOnlineDataSource.dart' as _i9;
import '../data/datasource/ProductsOnlineDataSource.dart' as _i16;
import '../data/repository/AuthenticationRepository.dart' as _i7;
import '../data/repository/CategoriesRepository.dart' as _i11;
import '../data/repository/ProductsRepository.dart' as _i18;
import '../domain/repository/AuthenticationRepository.dart' as _i6;
import '../domain/repository/CategoriesRepository.dart' as _i10;
import '../domain/repository/ProductsRepository.dart' as _i17;
import '../domain/usecase/GetCategoriesUseCase.dart' as _i12;
import '../domain/usecase/GetMostSellingUseCase.dart' as _i23;
import '../domain/usecase/GetProductsUseCase.dart' as _i24;
import '../domain/usecase/LoginUseCase.dart' as _i13;
import '../domain/usecase/RegisterUseCase.dart' as _i19;
import '../UI/category/categoriesViewModel.dart' as _i22;
import '../UI/homescreen/HomeViewModel.dart' as _i25;
import '../UI/login/LoginViewModel.dart' as _i14;
import '../UI/productsCatalog/CatalogViewModel.dart' as _i26;
import '../UI/register/RegisterViewModel.dart' as _i20;
import '../UI/wishlist/WishListViewModel.dart' as _i21;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(_i3.ApiManager());
    gh.factory<_i4.AuthenticationDataSource>(
        () => _i5.AuthenticationDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.AuthenticationRepository>(() =>
        _i7.AuthenticationRepositoryImpl(gh<_i4.AuthenticationDataSource>()));
    gh.factory<_i8.CategoriesDataSource>(
        () => _i9.CategoriesOnlineDataSource(gh<_i3.ApiManager>()));
    gh.factory<_i10.CategoriesRepository>(
        () => _i11.CategoriesRepositoryImpl(gh<_i8.CategoriesDataSource>()));
    gh.factory<_i12.GetCategoriesUseCase>(
        () => _i12.GetCategoriesUseCase(gh<_i10.CategoriesRepository>()));
    gh.factory<_i13.LoginUseCase>(
        () => _i13.LoginUseCase(gh<_i6.AuthenticationRepository>()));
    gh.factory<_i14.LoginViewModel>(
        () => _i14.LoginViewModel(gh<_i13.LoginUseCase>()));
    gh.factory<_i15.ProductsDataSource>(
        () => _i16.ProductsOnlineDataSource(gh<_i3.ApiManager>()));
    gh.factory<_i17.ProductsRepository>(
        () => _i18.ProductRepositoryImpl(gh<_i15.ProductsDataSource>()));
    gh.factory<_i19.RegisterUseCase>(
        () => _i19.RegisterUseCase(gh<_i6.AuthenticationRepository>()));
    gh.factory<_i20.RegisterViewModel>(
        () => _i20.RegisterViewModel(gh<_i19.RegisterUseCase>()));
    gh.factory<_i21.WishListViewModel>(() => _i21.WishListViewModel());
    gh.factory<_i22.CategoriesViewModel>(
        () => _i22.CategoriesViewModel(gh<_i12.GetCategoriesUseCase>()));
    gh.factory<_i23.GetMostSellingUseCase>(
        () => _i23.GetMostSellingUseCase(gh<_i17.ProductsRepository>()));
    gh.factory<_i24.GetProductsUseCase>(
        () => _i24.GetProductsUseCase(gh<_i17.ProductsRepository>()));
    gh.factory<_i25.HomeViewModel>(() => _i25.HomeViewModel(
          gh<_i12.GetCategoriesUseCase>(),
          gh<_i23.GetMostSellingUseCase>(),
        ));
    gh.factory<_i26.CatalogViewModel>(
        () => _i26.CatalogViewModel(gh<_i24.GetProductsUseCase>()));
    return this;
  }
}
