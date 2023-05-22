import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu_club/Bloc/CategoryBloc/category_bloc.dart';
import 'package:menu_club/Bloc/LoginBloc/login_bloc.dart';
import 'package:menu_club/Bloc/OrderBloc/order_bloc.dart';
import 'package:menu_club/Bloc/ProductBloc/product_bloc.dart';
import 'package:menu_club/Bloc/UpdateCategoryBloc/update_category_bloc.dart';

import 'Bloc/AddCategoryBloc/add_category_bloc.dart';
import 'Bloc/StoreBloc/store_bloc.dart';
import 'Ui/splashScreen.dart';

String basePath = "https://menuclub.uk/api/";
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(
        create: (context) => LoginBloc(),),
        BlocProvider(
          create: (context) => CategoryBloc(),),
        BlocProvider(
          create: (context) => OrderBloc(),),
        BlocProvider(
          create: (context) => StoreBloc(),),
        BlocProvider(
          create: (context) => ProductBloc(),),
        BlocProvider(
          create: (context) => UpdateCategoryBloc(),),
    BlocProvider(
          create: (context) => AddCategoryBloc(),),
      ],
        child: MaterialApp(debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
            ),
            home: Splash_Screen()
        ),

    );
  }
}

