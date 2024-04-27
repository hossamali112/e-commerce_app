
import 'package:ecommerce_app_c10_frida/data/datasource_contract/categories_datasource.dart';
import 'package:ecommerce_app_c10_frida/domain/entities/Category.dart';
import 'package:ecommerce_app_c10_frida/domain/repository/categories_repository.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CategoriesRepository)
class CategoryRepositoryImp extends CategoriesRepository{
  CategoriesDataSource categoriesDataSource;
  @factoryMethod
  CategoryRepositoryImp({required this.categoriesDataSource});
  @override
  Future<List<Category>?> getCategories() {
    return categoriesDataSource.getCategories();
  }

}