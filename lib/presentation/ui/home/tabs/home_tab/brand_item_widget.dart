import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app_c10_frida/domain/entities/Brand.dart';
import 'package:ecommerce_app_c10_frida/domain/entities/Category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandItemWidget extends StatelessWidget {
  Brand brand;
  BrandItemWidget({required this.brand});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(

      borderRadius: BorderRadius.circular(60),
      child: CachedNetworkImage(
        width: 80.w,
      height: 100.h,
      imageUrl: brand.image ?? '',
      placeholder: (context, url) => CircularProgressIndicator(),
      ),
    );
  }
}
