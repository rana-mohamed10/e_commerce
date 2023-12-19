import 'package:e_commerce/UI/appbar.dart';
import 'package:e_commerce/UI/category/categoriesViewModel.dart';
import 'package:e_commerce/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CategoryWidget.dart';

class CategoryTab extends StatelessWidget {
  CategoryTab({super.key});
  var viewModel = getIt<CategoriesViewModel>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyAppBar(),
        SizedBox(
          width: 420,
          height: 460,
          child: BlocBuilder(
              bloc: viewModel,
              builder: (context, state) {
                switch (state) {
                  case ErrorState():
                    {
                      return Center(
                        child: Column(
                          children: [
                            Text(state.message ?? "Something Went Wrong"),
                            ElevatedButton(
                                onPressed: () {
                                  viewModel.loadCategories();
                                },
                                child: Text("Try again"))
                          ],
                        ),
                      );
                    }
                  case SuccessState():
                    {
                      return GridView.builder(
                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                                        itemBuilder: (context, index) {
                      return CategoryWidget(state.categories[index]);
                                        },
                                        itemCount: state.categories.length,
                                      );
                    }
                  case LoadingState():
                    {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                }
                return Container();
              }),
        ),
      ],
    );
  }
}
