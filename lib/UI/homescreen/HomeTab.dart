import 'package:e_commerce/UI/appbar.dart';
import 'package:e_commerce/UI/homescreen/HomeCategoryWidget.dart';
import 'package:e_commerce/UI/homescreen/HomeViewModel.dart';
import 'package:e_commerce/domain/model/Category.dart';
import 'package:e_commerce/domain/model/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/di.dart';
import '../common/ProductWidget.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeViewModel viewModel= getIt<HomeViewModel>();


  @override
  void initState() {
    viewModel.initPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<HomeViewModel,HomeTabState>(
      bloc: viewModel,
      buildWhen: (previous, current) {
        if(current is Error) return false;
        if(current is Loading) return false;
        if(current is Success) return true;
        return false;
      },
      listenWhen: (previous, current) {
        if(current is Error) return true;
        if(current is Loading) return true;
        if(current is Success) return false;
        return false;
      },
      builder:(context, state) {
        if (state is Success) {
          return buildSuccessWidget(state.categories, state.products);
        }
        if (state is Loading){
          return Scaffold(
            appBar: AppBar(
              title: Text("Loading"),
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text("Default app"),
          ),
        );
      },
      listener: (context, state) {
        if(state is Loading){
          //show loading
        }
      },
    );
  }

  Widget buildSuccessWidget(List<Category>? categories,List<Product>? products) {
    return Scaffold(
      body: Stack(
        children: [
          MyAppBar(),
          Padding(
            padding: const EdgeInsets.only(top: 120.0,left: 8),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Popular Categories',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'See All',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 222,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories?.length ?? 0,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2/3,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            mainAxisExtent: 120,
                          ),
                          itemBuilder: (context, index) {
                            return HomeCategoryWidget(categories![index]);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 20,),),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Most Selling Products',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'See All',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 280,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: products?.length ?? 0,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 1.2,
                            crossAxisSpacing: 6,
                            mainAxisSpacing: 6,
                          ),
                          itemBuilder: (context, index) {
                            return ProductWidget(products![index]);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}