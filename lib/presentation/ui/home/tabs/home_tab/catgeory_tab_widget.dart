import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app_c10_frida/core/ex.dart';
import 'package:ecommerce_app_c10_frida/domain/entities/Category.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/home/tabs/home_tab/products_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryTabWidget extends StatelessWidget {
  Category category;
  CategoryTabWidget({required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       ProductsTab(category).goTo();
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        width: 50.w,
        height: 80.h,
        decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
        child: Column(
          children: [
            CachedNetworkImage(
              height: 80.h,
              fit: BoxFit.cover,
              imageUrl: category.image ?? '',
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),

            ),
            const Spacer(),
            Text(category.name??"",maxLines: 1,overflow: TextOverflow.ellipsis,)
          ],
        ),
      ),
    );
  }
}
