import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app_c10_frida/domain/entities/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductWidget extends StatelessWidget {
  Product product;
  ProductWidget({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(0.8,-0.8),
      children: [
        Container(
            width: 191.w,
            height: 280.h,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: Theme.of(context).primaryColor)),
            child: Container(
              width: 191.w,
                height: 237.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: 180.w,
                      height: 120.h,
                      imageUrl: product.imageCover ?? '',
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                  Container(
                    //padding: EdgeInsets.all(8),
                    child: Text(
                      product.title ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  Container(
                    //constraints: BoxConstraints(maxWidth: 191.w),
                    child: Text(
                      product.description ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text("EGP ${product.price.toString() ?? ""}"),
                  Row(
                    children: [
                      Text("Review (${product.ratingsAverage.toString() ?? ""})"),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      const Spacer(),
                      CircleAvatar(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add,
                                size: 15.w,
                              )))
                    ],
                  ),
                ],
              ),
            )),
        CircleAvatar(
          child: Image.asset("assets/icons/ic_fav.png"),
        )
      ],
    );
  }
}
