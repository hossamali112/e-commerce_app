import 'package:ecommerce_app_c10_frida/domain/entities/Category.dart';
import 'package:ecommerce_app_c10_frida/domain/entities/Product.dart';
import 'package:ecommerce_app_c10_frida/domain/repository/product_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetProductsUseCase{
  ProductRepository productRepository;
  GetProductsUseCase({required this.productRepository});
  Future<List<Product>?> invoke([Category? category]){
      return productRepository.getProducts(categoryId:category?.id??"");
  }
}