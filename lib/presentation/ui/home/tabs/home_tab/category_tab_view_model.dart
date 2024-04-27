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
class CategoryTabViewModel extends Cubit<HomeTabState>{
  GetCategoriesUSeCase getCategoriesUseCase;
  @factoryMethod
  CategoryTabViewModel({required this.getCategoriesUseCase}):super(LoadingState(message: 'Loading'));

  void initPage()async{
    emit(LoadingState(message: 'Loading...'));
    try{
      var categories = await getCategoriesUseCase.invoke();
      emit(SuccessState(categories: categories));
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
  List<Category>? categories;

  SuccessState({this.categories});
}