import 'package:ecommerce_app_c10_frida/domain/entities/Brand.dart';

abstract class BrandsRepository{
  Future<List<Brand>?>getBrands();
}