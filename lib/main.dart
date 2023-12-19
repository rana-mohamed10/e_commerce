import 'package:e_commerce/UI/homescreen/homescreen.dart';
import 'package:e_commerce/UI/login/LoginScreen.dart';
import 'package:e_commerce/UI/productsCatalog/ProductsCatalog.dart';
import 'package:e_commerce/UI/register/RegisterScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'UI/MyBlocOberver.dart';
import 'di/di.dart';

void main() {
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF004182),
          primary:Color(0xFF004182) ),
          useMaterial3: true,
        ),
        routes: {
          HomeScreen.routeName:(_)=>HomeScreen(),
          ProductsCatalog.routeName:(_)=>ProductsCatalog(),
          LoginScreen.routeName:(_)=> LoginScreen(),
          RegisterScreen.routeName:(_)=> RegisterScreen()
        },
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}

