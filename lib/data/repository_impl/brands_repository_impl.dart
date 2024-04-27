import 'package:ecommerce_app_c10_frida/data/datasource_contract/brands_datasource.dart';
import 'package:ecommerce_app_c10_frida/domain/entities/Brand.dart';
import 'package:ecommerce_app_c10_frida/domain/repository/brands_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsRepository)
class BrandsRepositoryImpl extends BrandsRepository{
  BrandsDataSource brandsDataSource;
  @factoryMethod
  BrandsRepositoryImpl({required this.brandsDataSource});
  @override
  Future<List<Brand>?> getBrands() {
    return brandsDataSource.getBrands();
  }

}