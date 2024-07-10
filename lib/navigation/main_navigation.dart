import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe/pages/first_page/bloc/first_page_bloc.dart';
import 'package:testovoe/pages/first_page/view/first_page_view.dart';
import 'package:testovoe/pages/second_pade/bloc/second_page_bloc.dart';
import 'package:testovoe/pages/second_pade/view/second_page_view.dart';

abstract class RouteNames {
  static const String firstPage = '/';
  static const String secondPage = '/secondPage';
}

class MainNavigation {
  static Map<String, Widget Function(BuildContext)> routes = {
    RouteNames.firstPage: (context) => BlocProvider(
      create: (context) => FirstPageBloc(),
      child: const FirstPage(),
    ),
    RouteNames.secondPage: (context) => BlocProvider(
      create: (context) => SecondPageBloc(),
      child: const SecondPage(),
    ),
  };
}
