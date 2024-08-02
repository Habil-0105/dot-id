import 'package:dot/shared/utils/constants/app_constant.dart';
import 'package:dot/themes/app_color.dart';
import 'package:flutter/material.dart';

enum Category{
  food(name: AppConstant.food, icon: "assets/food.png", color: AppColor.food),
  internet(name: AppConstant.internet, icon: "assets/internet.png", color: AppColor.internet),
  education(name: AppConstant.education, icon: "assets/education.png", color: AppColor.education),
  gift(name: AppConstant.gift, icon: "assets/gift.png", color: AppColor.gift),
  transport(name: AppConstant.transport, icon: "assets/transport.png", color: AppColor.transport),
  cart(name: AppConstant.cart, icon: "assets/cart.png", color: AppColor.cart),
  home(name: AppConstant.home, icon: "assets/home.png", color: AppColor.home),
  sport(name: AppConstant.sport, icon: "assets/sport.png", color: AppColor.sport),
  entertainment(name: AppConstant.entertainment, icon: "assets/entertainment.png", color: AppColor.entertainment);

  const Category({required this.name, required this.icon, required this.color});

  final String name;
  final String icon;
  final Color color;
}