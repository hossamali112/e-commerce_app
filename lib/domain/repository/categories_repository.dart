import 'package:ecommerce_app_c10_frida/domain/entities/Category.dart';

abstract class CategoriesRepository{
  Future<List<Category>?>getCategories();
}