import 'package:ecommerce_app_c10_frida/data/api_manager/api_manager.dart';
import 'package:ecommerce_app_c10_frida/data/datasource_contract/brands_datasource.dart';
import 'package:ecommerce_app_c10_frida/domain/entities/Brand.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:BrandsDataSource )
class BrandsDataSourceImpl extends BrandsDataSource{
  ApiManager apiManager;
  @factoryMethod
  BrandsDataSourceImpl({required this.apiManager});
  @override
  Future<List<Brand>?> getBrands() async{
    var response = await apiManager.getBrands();
    return response.data?.map((brandDto) => brandDto.toBrand()).toList();
  }

}