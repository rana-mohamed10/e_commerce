import 'package:e_commerce/UI/common/LoginRequiredWidget.dart';
import 'package:e_commerce/UI/login/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/di.dart';
import 'WishListViewModel.dart';

class WishListTab extends StatelessWidget {
   WishListTab({super.key});

  var viewModel=getIt<WishListViewModel>();


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListViewModel,WishListState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state){
          case UnUthenticatedUserState():{
            return Center(
              child: LoginRequiredWidget('Please Login To see WishList',
                      () {
                Navigator.of(context).pushNamed(LoginScreen.routeName);
                      }),
            );
          }
        }
    },);
  }
}
