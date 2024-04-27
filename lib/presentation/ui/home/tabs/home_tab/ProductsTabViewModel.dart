import 'package:ecommerce_app_c10_frida/domain/entities/Brand.dart';
import 'package:ecommerce_app_c10_frida/domain/entities/Category.dart';
import 'package:ecommerce_app_c10_frida/domain/entities/Product.dart';
import 'package:ecommerce_app_c10_frida/domain/repository/categories_repository.dart';
import 'package:ecommerce_app_c10_frida/domain/usecases/get_brands_usecase.dart';
import 'package:ecommerce_app_c10_frida/domain/usecases/get_categories_usecase.dart';
import 'package:ecommerce_app_c10_frida/domain/usecases/get_products_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class ProductTabViewModel extends Cubit<HomeTabState>{
  GetProductsUseCase getProductsUseCase;
  @factoryMethod
  ProductTabViewModel({ required this.getProductsUseCase}):super(LoadingState(message: 'Loading'));

  void initPage(Category category)async{
    emit(LoadingState(message: 'Loading...'));
    try{
      var products = await getProductsUseCase.invoke(category);
      emit(SuccessState(products: products));
    }catch(e){
      emit(ErrorState(errorMessage: e.toString()));
    }

  }

}
sealed class HomeTabState{

}
class LoadingState extends HomeTabState{
  String message;
  LoadingState({required this.message});
}
class ErrorState extends HomeTabState{
  String? errorMessage;
  ErrorState({this.errorMessage});
}
class SuccessState extends HomeTabState{
  List<Product>? products;
  SuccessState({ this.products});
}