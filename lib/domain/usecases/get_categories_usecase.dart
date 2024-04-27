
import 'package:ecommerce_app_c10_frida/data/repository_impl/categories_repository_impl.dart';
import 'package:ecommerce_app_c10_frida/domain/entities/Category.dart';
import 'package:ecommerce_app_c10_frida/domain/repository/categories_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetCategoriesUSeCase{
  // functional requirements
  // businessLogic
  CategoriesRepository categoryRepository;
  @factoryMethod
  GetCategoriesUSeCase({required this.categoryRepository});
  Future<List<Category>?>invoke(){
   return categoryRepository.getCategories();
  }
}