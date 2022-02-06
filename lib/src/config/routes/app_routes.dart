import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/presentation/views/news/bloc/news_bloc.dart';
import 'package:flutter_application_1/src/presentation/views/news/news_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(
          BlocProvider(
            create: (BuildContext context) => getIt<NewsBloc>(),
            child: const NewsScreen(),
          ),
        );

      default:
        return _materialRoute(const NewsScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
