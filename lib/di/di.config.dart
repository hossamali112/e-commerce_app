// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/api_manager/api_manager.dart' as _i3;
import '../data/datasource_contract/auth_datasource.dart' as _i12;
import '../data/datasource_contract/brands_datasource.dart' as _i8;
import '../data/datasource_contract/categories_datasource.dart' as _i4;
import '../data/datasource_contract/product_datasource.dart' as _i10;
import '../data/datasource_impl/auth_datasource_impl.dart' as _i13;
import '../data/datasource_impl/brands_datasource_impl.dart' as _i9;
import '../data/datasource_impl/categories_datasource_impl.dart' as _i5;
import '../data/datasource_impl/products_datasource_impl.dart' as _i11;
import '../data/repository_impl/auth_repository_impl.dart' as _i15;
import '../data/repository_impl/brands_repository_impl.dart' as _i20;
import '../data/repository_impl/categories_repository_impl.dart' as _i7;
import '../data/repository_impl/products_repository_impl.dart' as _i23;
import '../domain/repository/auth_repository.dart' as _i14;
import '../domain/repository/brands_repository.dart' as _i19;
import '../domain/repository/categories_repository.dart' as _i6;
import '../domain/repository/product_repository.dart' as _i22;
import '../domain/usecases/get_brands_usecase.dart' as _i25;
import '../domain/usecases/get_categories_usecase.dart' as _i16;
import '../domain/usecases/get_products_usecase.dart' as _i26;
import '../domain/usecases/sign_in_usecase.dart' as _i18;
import '../domain/usecases/sign_up_usecase.dart' as _i17;
import '../presentation/ui/home/tabs/home_tab/category_tab_view_model.dart'
    as _i21;
import '../presentation/ui/home/tabs/home_tab/home_tab_view_model.dart' as _i29;
import '../presentation/ui/home/tabs/home_tab/ProductsTabViewModel.dart'
    as _i28;
import '../presentation/ui/sign_in/sign_in_viewModel.dart' as _i27;
import '../presentation/ui/sign_up/sign_up_viewModel.dart' as _i24;

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
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.CategoriesDataSource>(
        () => _i5.CategoriesDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i6.CategoriesRepository>(() => _i7.CategoryRepositoryImp(
        categoriesDataSource: gh<_i4.CategoriesDataSource>()));
    gh.factory<_i8.BrandsDataSource>(
        () => _i9.BrandsDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i10.ProductDataSource>(
        () => _i11.ProductsDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i12.AuthDataSource>(
        () => _i13.AuthDataSourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i14.AuthRepository>(() =>
        _i15.AuthRepositoryImpl(authDataSource: gh<_i12.AuthDataSource>()));
    gh.factory<_i16.GetCategoriesUSeCase>(() => _i16.GetCategoriesUSeCase(
        categoryRepository: gh<_i6.CategoriesRepository>()));
    gh.factory<_i17.SignUpUseCase>(
        () => _i17.SignUpUseCase(authRepository: gh<_i14.AuthRepository>()));
    gh.factory<_i18.SignInUseCase>(
        () => _i18.SignInUseCase(authRepository: gh<_i14.AuthRepository>()));
    gh.factory<_i19.BrandsRepository>(() => _i20.BrandsRepositoryImpl(
        brandsDataSource: gh<_i8.BrandsDataSource>()));
    gh.factory<_i21.CategoryTabViewModel>(() => _i21.CategoryTabViewModel(
        getCategoriesUseCase: gh<_i16.GetCategoriesUSeCase>()));
    gh.factory<_i22.ProductRepository>(() => _i23.ProductsRepositoryImpl(
        productDataSource: gh<_i10.ProductDataSource>()));
    gh.factory<_i24.SignUpViewModel>(
        () => _i24.SignUpViewModel(signUpUseCase: gh<_i17.SignUpUseCase>()));
    gh.factory<_i25.GetBrandsUseCase>(() =>
        _i25.GetBrandsUseCase(brandsRepository: gh<_i19.BrandsRepository>()));
    gh.factory<_i26.GetProductsUseCase>(() => _i26.GetProductsUseCase(
        productRepository: gh<_i22.ProductRepository>()));
    gh.factory<_i27.SignInViewModel>(
        () => _i27.SignInViewModel(signInUseCase: gh<_i18.SignInUseCase>()));
    gh.factory<_i28.ProductTabViewModel>(() => _i28.ProductTabViewModel(
        getProductsUseCase: gh<_i26.GetProductsUseCase>()));
    gh.factory<_i29.HomeTabViewModel>(() => _i29.HomeTabViewModel(
          getCategoriesUseCase: gh<_i16.GetCategoriesUSeCase>(),
          getBrandsUseCase: gh<_i25.GetBrandsUseCase>(),
          getProductsUseCase: gh<_i26.GetProductsUseCase>(),
        ));
    return this;
  }
}
