import 'package:e_commerce/UI/common/ProductWidget.dart';
import 'package:e_commerce/UI/productsCatalog/CatalogViewModel.dart';
import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/domain/model/Category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../appbar.dart';

class ProductsCatalog extends StatelessWidget {
   ProductsCatalog({super.key});
   static const String routeName='catalogScreen';
  var viewModel=getIt<CatalogViewModel>();

  @override
  Widget build(BuildContext context) {
    var category=ModalRoute.of(context)?.settings.arguments as Category?;
    viewModel.loadProducts(category);
    return Scaffold(
      body: Column(
        children: [
          MyAppBar(),
          SizedBox(
            width: 412,
            height: 662,
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
                                    viewModel.loadProducts();
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
                              crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.65),
                          itemBuilder: (context, index) {
                            return ProductWidget(state.products![index]);
                          },
                          itemCount: state.products?.length,
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
      ),
    );
  }
}
