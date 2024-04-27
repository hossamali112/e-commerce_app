import 'package:ecommerce_app_c10_frida/presentation/ui/home/tabs/home_tab/catgeory_tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../di/di.dart';
import 'category_item_widget.dart';
import 'category_tab_view_model.dart';

class CategoryTab extends StatefulWidget {
  const CategoryTab({super.key});

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {
  var viewModel = getIt<CategoryTabViewModel>();
  @override
  void initState() {
    super.initState();
    viewModel.initPage();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: viewModel,
      builder: (context,state) {
        return GridView.builder(
          itemCount: state is SuccessState ? state.categories!.length : 0,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index) {
              switch(state){
                case LoadingState():{
                  return Center(child: CircularProgressIndicator(),);
                }
                case ErrorState():{
                  return Center(child: Text(state.errorMessage ?? ''),);
                }case SuccessState():{
                return CategoryTabWidget(
                  category: state.categories![index],
                );
                }
              }
            },);
      }
    );
  }
}
