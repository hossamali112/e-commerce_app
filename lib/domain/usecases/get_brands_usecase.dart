import 'package:ecommerce_app_c10_frida/domain/entities/Brand.dart';
import 'package:ecommerce_app_c10_frida/domain/repository/brands_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetBrandsUseCase{
  BrandsRepository brandsRepository;
 @factoryMethod
  GetBrandsUseCase({required this.brandsRepository});

  Future<List<Brand>?>invoke(){
    return brandsRepository.getBrands();
  }
}