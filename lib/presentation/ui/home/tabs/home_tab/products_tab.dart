import 'package:ecommerce_app_c10_frida/di/di.dart';
import 'package:ecommerce_app_c10_frida/domain/entities/Category.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/home/tabs/home_tab/ProductsTabViewModel.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/home/tabs/home_tab/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsTab extends StatefulWidget {
  Category category;
  ProductsTab(this.category);

  @override
  State<ProductsTab> createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {
  var viewModel = getIt<ProductTabViewModel>();
  @override
  void initState() {
    viewModel.initPage(widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.category.name ?? ""),
        ),
        body: BlocBuilder(
            bloc: viewModel,
            builder: (context, state) {
              return GridView.builder(
                itemCount: state is SuccessState ? state.products!.length : 0,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 8 / 10),
                itemBuilder: (context, index) {
                  switch (state) {
                    case LoadingState():
                      {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    case ErrorState():
                      {
                        return Center(
                          child: Text(state.errorMessage ?? ''),
                        );
                      }
                    case SuccessState():
                      {
                        return ProductWidget(
                          product: state.products![index],
                        );
                      }
                  }
                },
              );
            }));
  }
}
