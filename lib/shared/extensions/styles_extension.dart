import 'package:dot/themes/app_colors_style.dart';
import 'package:flutter/material.dart';

extension ColorsExtension on BuildContext {
  AppColorsExtension get appColors => Theme.of(this).extension<AppColorsExtension>()!;
}