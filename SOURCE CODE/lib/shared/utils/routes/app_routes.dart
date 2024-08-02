import 'package:dot/features/expense/presentation/pages/add/add_page.dart';
import 'package:dot/features/expense/presentation/pages/home/home_page.dart';
import 'package:dot/shared/extensions/styles_extension.dart';
import 'package:dot/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class AppRoutes{
  static const homePage = '/';
  static const addPage = '/add';

  static Route<dynamic>? onGenerateRoutes(RouteSettings settings){
    switch(settings.name){
      case homePage:
        return _pageRouteBuilder(page: const HomePage());
      case addPage:
        return _pageRouteBuilder(page: const AddPage());
      default:
        return MaterialPageRoute(builder: (context){
          final colors = context.appColors;

          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text(
                "No route defined for ${settings.name}",
                style: AppTypography.heading8.copyWith(color: colors.error),
              ),
            ),
          );
        });
    }
  }

  static PageRouteBuilder<dynamic> _pageRouteBuilder({required Widget page}){
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return page;
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        }
    );
  }
}