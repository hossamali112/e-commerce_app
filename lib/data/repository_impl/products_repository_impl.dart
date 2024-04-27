import 'package:ecommerce_app_c10_frida/data/datasource_contract/product_datasource.dart';
import 'package:ecommerce_app_c10_frida/domain/entities/Product.dart';
import 'package:ecommerce_app_c10_frida/domain/repository/product_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ProductRepository)
class ProductsRepositoryImpl extends ProductRepository{
  ProductDataSource productDataSource;
 @factoryMethod
  ProductsRepositoryImpl({required this.productDataSource});
  @override
  Future<List<Product>?> getProducts({ProductSort? sortBy,String? categoryId}) {
    return productDataSource.getProducts(categoryId:categoryId??"");
  }

}