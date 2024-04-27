import 'package:ecommerce_app_c10_frida/domain/entities/Product.dart';

abstract class ProductRepository{
  Future<List<Product>?>getProducts({ProductSort? sortBy,String? categoryId});
}
enum ProductSort{
  mostSelling("-sold"),
  highestPrice("-price");
  final String value;
  const ProductSort(this.value);
}